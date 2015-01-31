#!/usr/bin/perl

#
#  Copyright 2006 Dr. Georg Fischer <punctum at punctum dot kom>
# 
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
# 
#       http://www.apache.org/licenses/LICENSE-2.0
# 
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
# check jars in CLASSPATH for readability
# @(#) $Id: schema_xref_ok.pl 40 2008-09-08 06:41:22Z gfis $
# Copyright (c) 2006 Dr. Georg Fischer <punctum@punctum.com>
# 2006-04-21: copied from client.pl
#
# Usage: 
#   perl schema_xref.pl schema1.xsd schema2.xsd ...
#------------------------------------------------------------------ 

use strict;

	my %hash = ();
	my @ref; # short keys for the schemata in input order
	my $iref = 0;
    foreach my $xsd (@ARGV) {
    	$ref[$iref ++] = & gather1($xsd);
    } # foreach argument
    
    # now print the crossreference for all types
	print <<'GFis';
<?xml version="1.0" encoding="UTF-8"?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Namespace Crossreference</title>
<style>
<!--
dt { font-family:Lucida Console,Courier,monospace; font-weight: bold; }
dd { font-family:Lucida Console,Courier,monospace ; }
-->
</style>
</head>
<body>
<h2>List of Types</h2>
<dl>
GFis

    my @list = sort(keys(%hash)); # all entries (lines) collected above
    push(@list, "zzzz;zzzz;zzzz"; # for final group change checking
	my @row; # resulting values in schema input order
	my $ilist = 0; 
	my ($old_type, $old_tag, $old_short) = ("", "", "");
	while ($ilist < scalar(@list)) {
		my ($type, $tag, $short) = split (/\;/, @list[$ilist ++]);
		if ($type ne $old_type) { # group change
			$old_type = $type;
			$old_tag  = $tag;
			print "<dt>$type</dt>\n";
		} # if grpup change
		print "<dd>&lt;$tag&gt;&nbsp;&nbsp;($short)</dd>\n";
		$ilist ++;
	} # while $ilist
	
	print <<'GFis';
</dl>
</body>
</html>
GFis

sub init_row {
	for (my $irow = 0; $irow < scalar(@ref); $irow ++) {
		$row[$irow] = "&nbsp;";
	} # for $irow
} # init_row

sub print_row {
	print "<tr>";
	for (my $irow = 0; $irow < scalar(@ref); $irow ++) {
		print "<td>" . $row[$irow] . "</td>";
	} # for $irow
	print "</tr\n";
} # init_row

sub gather1 {
	my ($infile) = @_;
	$infile =~ m[((camt|pacs|pain)\.\d{3})\.];
	my $short = $1; # e.g. "camt.052"
	# open (IN, "<", $infile) || die "cannot read $infile";
	# while (<IN>) {
	foreach (split (/\r?\n/, `java -cp dist/xtool.jar org.teherba.xtool.SchemaTree -c -a -t -i -h $infile`)) {
		if (m[\A\<(\w+)\>[^A-z]+([A-Z]\w+)]) { # tag and type
			my $tag  = $1;
			my $type = $2;
			# print "$short\t$tag\t$type\n";
			$hash{$type . ";" . $tag . ";" . $short} = 1;
		} # if tag and type
	} # while IN
	# close(IN);
	return $short;
} # gather1
