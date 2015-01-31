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
# @(#) $Id: schema_xref.pl 40 2008-09-08 06:41:22Z gfis $
# Copyright (c) 2006 Dr. Georg Fischer <punctum@punctum.com>
# 2007-10-09: copied from client.pl
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
<title>Schema Type Crossreference</title>
<style>
<!--
dt { font-family:Lucida Console,Courier,monospace; font-weight: bold; }
dd { font-family:Lucida Console,Courier,monospace ; }
-->
</style>
</head>
<body>
<p>
The following schemata were evaluated:<br />
GFis
	for ($iref = 0; $iref < scalar(@ref); $iref ++) {
		print $ARGV[$iref], "<br />\n";
	}
	print <<'GFis';
</p>
<table>
<h2>List of Types</h2>
<dl>
GFis

    my @list = sort(keys(%hash)); # all entries (lines) collected above
    push(@list, "zzzz|zzzz|zzzz"); # for final group change checking
	my @row; # resulting values in schema input order
	my $ilist = 0; 
	my ($old_type, $old_tag) = ("", "");
	$ilist = 0;
	while ($ilist < scalar(@list)) {
		# print "<!-- " . $list[$ilist] . "-->\n";
		my ($type, $tag, $short) = split (/\|/, $list[$ilist ++]);
		if ($type ne $old_type) { # type group change
			if ($ilist > 0) { # not the first - close old table and dd
				& print_row();
				print "</table></dd>\n";
			}
			$old_type = $type;
			$old_tag  = "";
			if ($type ne "zzzz") {
				print "<dt>$type</dt><dd><table border=\"1\" cellpadding=\"2\" cellspacing=\"0\">\n";
				& init_row();
			}
		} # if type group change
		if ($old_tag ne $tag) { # tag group change
			if ($old_tag ne "") { # not the first - close this row
				& print_row();
				& init_row();
			}
			$old_tag = $tag;
		} # if tag group change
		& set_in_row($short, "$tag");
	} # while $ilist
	
	print <<'GFis';
</dl>
</body>
</html>
GFis

sub init_row {
	for (my $icol = 0; $icol < scalar(@ref); $icol ++) {
		$row[$icol] = "&nbsp;";
	} # for $icol
} # init_row

sub set_in_row {
	my ($key, $value) = @_;
	for (my $icol = 0; $icol < scalar(@ref); $icol ++) {
		if ($ref[$icol] eq $key) {
			$row[$icol] = $value;
		}
	} # for $icol
} # set_in_row

sub print_row {
	print "<tr>";
	for (my $icol = 0; $icol < scalar(@ref); $icol ++) {
		print "<td width=\"128\">" . $row[$icol] . "</td>";
	} # for $icol
	print "</tr\n";
} # init_row

sub gather1 {
	my ($infile) = @_;
	$infile =~ m[((camt|pacs|pain)\.\d{3})\.];
	my $code = $1; # e.g. "camt.052"
	# open (IN, "<", $infile) || die "cannot read $infile";
	# while (<IN>) {
	foreach (split (/\r?\n/, `java -cp dist/xtool.jar org.teherba.xtool.SchemaTree -c -a -t -i -h $infile`)) {
		if (m[\A\<(\w+)\>[^A-Z]*([A-Z]\w+)]) { # tag and type
			my $tag  = $1;
			my $type = $2;
			my $key = "$type|$tag|$code";
			# print "$key<br />\n";
			$hash{$key} = 1;
		} # if tag and type
	} # while IN
	# close(IN);
	return $code;
} # gather1
