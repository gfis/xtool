<?xml version="1.0" encoding="UTF-8"?>
<Document xmlns="urn:iso:std:iso:20022:tech:xsd:camt.052.001.01"><!--[1..1] Document    -->
    <BkToCstmrAcctRptV01><!--[1..1] BankToCustomerAccountReportV01   -->
        <GrpHdr><!--[1..1] GroupHeader23   -->
            <MsgId>Max35Text</MsgId><!--[1..1] Max35Text string  1..35  -->
            <CreDtTm>2007-06-29T04:30:00Z</CreDtTm><!--[1..1] ISODateTime dateTime  -->
            <MsgRcpt><!--[0..1] PartyIdentification8   -->
                <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                <PstlAdr><!--[0..1] PostalAddress1   -->
                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                </PstlAdr>
                <Id><!--[0..1] Party2Choice   -->
                    <__unresolvedChoice__><!--[1..1]    -->
                      <OrgId><!--[1..1] OrganisationIdentification2   -->
                          <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                          <IBEI>AZBDFHJNP0</IBEI><!--[0..1] IBEIIdentifier string  /[A-Z]{2,2}[B-DF-HJ-NP-TV-XZ0-9]{7,7}[0-9]{1,1}/  -->
                          <BEI>BEIADEFF</BEI><!--[0..1] BEIIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                          <EANGLN>0909090909090</EANGLN><!--[0..1] EANGLNIdentifier string  /[0-9]{13,13}/  -->
                          <USCHU>CH012345</USCHU><!--[0..1] CHIPSUniversalIdentifier string  /CH[0-9]{6,6}/  -->
                          <DUNS>090909090</DUNS><!--[0..1] DunsIdentifier string  /[0-9]{9,9}/  -->
                          <BkPtyId>Max35Text</BkPtyId><!--[0..1] Max35Text string  1..35  -->
                          <TaxIdNb>Max35Text</TaxIdNb><!--[0..1] Max35Text string  1..35  -->
                          <PrtryId><!--[0..1] GenericIdentification3   -->
                              <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                              <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                          </PrtryId>
                      </OrgId>
                      <PrvtId><!--[1..4] PersonIdentification3   -->
                          <__unresolvedChoice__><!--[1..1]    -->
                            <DrvrsLicNb>Max35Text</DrvrsLicNb><!--[1..1] Max35Text string  1..35  -->
                            <CstmrNb>Max35Text</CstmrNb><!--[1..1] Max35Text string  1..35  -->
                            <SclSctyNb>Max35Text</SclSctyNb><!--[1..1] Max35Text string  1..35  -->
                            <AlnRegnNb>Max35Text</AlnRegnNb><!--[1..1] Max35Text string  1..35  -->
                            <PsptNb>Max35Text</PsptNb><!--[1..1] Max35Text string  1..35  -->
                            <TaxIdNb>Max35Text</TaxIdNb><!--[1..1] Max35Text string  1..35  -->
                            <IdntyCardNb>Max35Text</IdntyCardNb><!--[1..1] Max35Text string  1..35  -->
                            <MplyrIdNb>Max35Text</MplyrIdNb><!--[1..1] Max35Text string  1..35  -->
                            <DtAndPlcOfBirth><!--[1..1] DateAndPlaceOfBirth   -->
                                <BirthDt>2007-06-29</BirthDt><!--[1..1] ISODate date  -->
                                <PrvcOfBirth>Max35Text</PrvcOfBirth><!--[0..1] Max35Text string  1..35  -->
                                <CityOfBirth>Max35Text</CityOfBirth><!--[1..1] Max35Text string  1..35  -->
                                <CtryOfBirth>AZ</CtryOfBirth><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                            </DtAndPlcOfBirth>
                            <OthrId><!--[1..1] GenericIdentification4   -->
                                <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                <IdTp>Max35Text</IdTp><!--[1..1] Max35Text string  1..35  -->
                            </OthrId>
                          </__unresolvedChoice__>
                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                      </PrvtId>
                    </__unresolvedChoice__>
                </Id>
                <CtryOfRes>AZ</CtryOfRes><!--[0..1] CountryCode string  /[A-Z]{2,2}/  -->
            </MsgRcpt>
            <MsgPgntn><!--[0..1] Pagination   -->
                <PgNb>09</PgNb><!--[1..1] Max5NumericText string  /[0-9]{1,5}/  -->
                <LastPgInd>true</LastPgInd><!--[1..1] YesNoIndicator boolean  -->
            </MsgPgntn>
            <AddtlInf>Max500Text</AddtlInf><!--[0..1] Max500Text string  1..500  -->
        </GrpHdr>
        <Rpt><!--[1..n] AccountReport9   -->
            <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
            <ElctrncSeqNb>1</ElctrncSeqNb><!--[0..1] Number decimal  L18.0  -->
            <LglSeqNb>1</LglSeqNb><!--[0..1] Number decimal  L18.0  -->
            <CreDtTm>2007-06-29T04:30:00Z</CreDtTm><!--[1..1] ISODateTime dateTime  -->
            <FrToDt><!--[0..1] DateTimePeriodDetails   -->
                <FrDtTm>2007-06-29T04:30:00Z</FrDtTm><!--[1..1] ISODateTime dateTime  -->
                <ToDtTm>2007-06-29T04:30:00Z</ToDtTm><!--[1..1] ISODateTime dateTime  -->
            </FrToDt>
            <CpyDplctInd>CODU</CpyDplctInd><!--[0..1] CopyDuplicate1Code string  "CODU"|"COPY"|"DUPL" -->
            <Acct><!--[1..1] CashAccount13   -->
                <Id><!--[1..1] AccountIdentification3Choice   -->
                    <__unresolvedChoice__><!--[1..1]    -->
                      <IBAN>DE28500400000123456589</IBAN><!--[1..1] IBANIdentifier string  /[a-zA-Z]{2,2}[0-9]{2,2}[a-zA-Z0-9]{1,30}/  -->
                      <BBAN>azAZ09</BBAN><!--[1..1] BBANIdentifier string  /[a-zA-Z0-9]{1,30}/  -->
                      <UPIC>09090909</UPIC><!--[1..1] UPICIdentifier string  /[0-9]{8,17}/  -->
                      <PrtryAcct><!--[1..1] SimpleIdentificationInformation2   -->
                          <Id>Max34Text</Id><!--[1..1] Max34Text string  1..34  -->
                      </PrtryAcct>
                    </__unresolvedChoice__>
                </Id>
                <Tp><!--[0..1] CashAccountType2   -->
                    <__unresolvedChoice__><!--[1..1]    -->
                      <Cd>CACC</Cd><!--[1..1] CashAccountType4Code string  "CACC"|"CASH"|"CHAR"|"CISH"|"COMM"|"LOAN"|"MGLD"|"MOMA"|"NREX"|"ODFT"|"ONDP"|"SACC"|"SLRY"|"SVGS"|"TAXE"|"TRAS" -->
                      <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                    </__unresolvedChoice__>
                </Tp>
                <Ccy>EUR</Ccy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                <Ownr><!--[0..1] PartyIdentification8   -->
                    <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                    <PstlAdr><!--[0..1] PostalAddress1   -->
                        <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                        <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                        <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                        <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                        <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                        <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                        <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                        <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                    </PstlAdr>
                    <Id><!--[0..1] Party2Choice   -->
                        <__unresolvedChoice__><!--[1..1]    -->
                          <OrgId><!--[1..1] OrganisationIdentification2   -->
                              <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                              <IBEI>AZBDFHJNP0</IBEI><!--[0..1] IBEIIdentifier string  /[A-Z]{2,2}[B-DF-HJ-NP-TV-XZ0-9]{7,7}[0-9]{1,1}/  -->
                              <BEI>BEIADEFF</BEI><!--[0..1] BEIIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                              <EANGLN>0909090909090</EANGLN><!--[0..1] EANGLNIdentifier string  /[0-9]{13,13}/  -->
                              <USCHU>CH012345</USCHU><!--[0..1] CHIPSUniversalIdentifier string  /CH[0-9]{6,6}/  -->
                              <DUNS>090909090</DUNS><!--[0..1] DunsIdentifier string  /[0-9]{9,9}/  -->
                              <BkPtyId>Max35Text</BkPtyId><!--[0..1] Max35Text string  1..35  -->
                              <TaxIdNb>Max35Text</TaxIdNb><!--[0..1] Max35Text string  1..35  -->
                              <PrtryId><!--[0..1] GenericIdentification3   -->
                                  <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                  <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                              </PrtryId>
                          </OrgId>
                          <PrvtId><!--[1..4] PersonIdentification3   -->
                              <__unresolvedChoice__><!--[1..1]    -->
                                <DrvrsLicNb>Max35Text</DrvrsLicNb><!--[1..1] Max35Text string  1..35  -->
                                <CstmrNb>Max35Text</CstmrNb><!--[1..1] Max35Text string  1..35  -->
                                <SclSctyNb>Max35Text</SclSctyNb><!--[1..1] Max35Text string  1..35  -->
                                <AlnRegnNb>Max35Text</AlnRegnNb><!--[1..1] Max35Text string  1..35  -->
                                <PsptNb>Max35Text</PsptNb><!--[1..1] Max35Text string  1..35  -->
                                <TaxIdNb>Max35Text</TaxIdNb><!--[1..1] Max35Text string  1..35  -->
                                <IdntyCardNb>Max35Text</IdntyCardNb><!--[1..1] Max35Text string  1..35  -->
                                <MplyrIdNb>Max35Text</MplyrIdNb><!--[1..1] Max35Text string  1..35  -->
                                <DtAndPlcOfBirth><!--[1..1] DateAndPlaceOfBirth   -->
                                    <BirthDt>2007-06-29</BirthDt><!--[1..1] ISODate date  -->
                                    <PrvcOfBirth>Max35Text</PrvcOfBirth><!--[0..1] Max35Text string  1..35  -->
                                    <CityOfBirth>Max35Text</CityOfBirth><!--[1..1] Max35Text string  1..35  -->
                                    <CtryOfBirth>AZ</CtryOfBirth><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </DtAndPlcOfBirth>
                                <OthrId><!--[1..1] GenericIdentification4   -->
                                    <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                    <IdTp>Max35Text</IdTp><!--[1..1] Max35Text string  1..35  -->
                                </OthrId>
                              </__unresolvedChoice__>
                              <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                          </PrvtId>
                        </__unresolvedChoice__>
                    </Id>
                    <CtryOfRes>AZ</CtryOfRes><!--[0..1] CountryCode string  /[A-Z]{2,2}/  -->
                </Ownr>
                <Svcr><!--[0..1] BranchAndFinancialInstitutionIdentification3   -->
                    <FinInstnId><!--[1..1] FinancialInstitutionIdentification5Choice   -->
                        <__unresolvedChoice__><!--[1..1]    -->
                          <BIC>COBADEFF</BIC><!--[1..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                          <ClrSysMmbId><!--[1..1] ClearingSystemMemberIdentification3Choice   -->
                              <__unresolvedChoice__><!--[1..1]    -->
                                <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                              </__unresolvedChoice__>
                          </ClrSysMmbId>
                          <NmAndAdr><!--[1..1] NameAndAddress7   -->
                              <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                              <PstlAdr><!--[1..1] PostalAddress1   -->
                                  <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                  <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                  <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                  <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                  <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                  <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                  <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                  <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                              </PstlAdr>
                          </NmAndAdr>
                          <PrtryId><!--[1..1] GenericIdentification3   -->
                              <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                              <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                          </PrtryId>
                          <CmbndId><!--[1..1] FinancialInstitutionIdentification3   -->
                              <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                              <ClrSysMmbId><!--[0..1] ClearingSystemMemberIdentification3Choice   -->
                                  <__unresolvedChoice__><!--[1..1]    -->
                                    <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                    <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                  </__unresolvedChoice__>
                              </ClrSysMmbId>
                              <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                              <PstlAdr><!--[0..1] PostalAddress1   -->
                                  <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                  <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                  <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                  <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                  <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                  <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                  <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                  <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                              </PstlAdr>
                              <PrtryId><!--[0..1] GenericIdentification3   -->
                                  <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                  <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                              </PrtryId>
                          </CmbndId>
                        </__unresolvedChoice__>
                    </FinInstnId>
                    <BrnchId><!--[0..1] BranchData   -->
                        <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                        <Nm>Max35Text</Nm><!--[0..1] Max35Text string  1..35  -->
                        <PstlAdr><!--[0..1] PostalAddress1   -->
                            <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                            <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                            <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                            <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                            <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                            <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                            <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                            <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                        </PstlAdr>
                    </BrnchId>
                </Svcr>
            </Acct>
            <RltdAcct><!--[0..1] CashAccount7   -->
                <Id><!--[1..1] AccountIdentification3Choice   -->
                    <__unresolvedChoice__><!--[1..1]    -->
                      <IBAN>DE28500400000123456589</IBAN><!--[1..1] IBANIdentifier string  /[a-zA-Z]{2,2}[0-9]{2,2}[a-zA-Z0-9]{1,30}/  -->
                      <BBAN>azAZ09</BBAN><!--[1..1] BBANIdentifier string  /[a-zA-Z0-9]{1,30}/  -->
                      <UPIC>09090909</UPIC><!--[1..1] UPICIdentifier string  /[0-9]{8,17}/  -->
                      <PrtryAcct><!--[1..1] SimpleIdentificationInformation2   -->
                          <Id>Max34Text</Id><!--[1..1] Max34Text string  1..34  -->
                      </PrtryAcct>
                    </__unresolvedChoice__>
                </Id>
                <Tp><!--[0..1] CashAccountType2   -->
                    <__unresolvedChoice__><!--[1..1]    -->
                      <Cd>CACC</Cd><!--[1..1] CashAccountType4Code string  "CACC"|"CASH"|"CHAR"|"CISH"|"COMM"|"LOAN"|"MGLD"|"MOMA"|"NREX"|"ODFT"|"ONDP"|"SACC"|"SLRY"|"SVGS"|"TAXE"|"TRAS" -->
                      <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                    </__unresolvedChoice__>
                </Tp>
                <Ccy>EUR</Ccy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
            </RltdAcct>
            <Intrst><!--[0..n] AccountInterest1   -->
                <Tp><!--[0..1] InterestType1Choice   -->
                    <__unresolvedChoice__><!--[1..1]    -->
                      <Cd>INDY</Cd><!--[1..1] InterestType1Code string  "INDY"|"OVRN" -->
                      <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                    </__unresolvedChoice__>
                </Tp>
                <Rate><!--[0..n] Rate1   -->
                    <Rate><!--[1..1] RateTypeChoice   -->
                        <__unresolvedChoice__><!--[1..1]    -->
                          <PctgRate>1</PctgRate><!--[1..1] PercentageRate decimal  L11.10  -->
                          <TxtlRate>Max35Text</TxtlRate><!--[1..1] Max35Text string  1..35  -->
                        </__unresolvedChoice__>
                    </Rate>
                    <VldtyRg><!--[0..1] CurrencyAndAmountRange   -->
                        <Amt><!--[1..1] ImpliedCurrencyAmountRangeChoice   -->
                            <__unresolvedChoice__><!--[1..1]    -->
                              <FrAmt><!--[1..1] AmountRangeBoundary1   -->
                                  <BdryAmt>1</BdryAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                  <Incl>true</Incl><!--[1..1] YesNoIndicator boolean  -->
                              </FrAmt>
                              <ToAmt><!--[1..1] AmountRangeBoundary1   -->
                                  <BdryAmt>1</BdryAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                  <Incl>true</Incl><!--[1..1] YesNoIndicator boolean  -->
                              </ToAmt>
                              <FrToAmt><!--[1..1] FromToAmountRange   -->
                                  <FrAmt><!--[1..1] AmountRangeBoundary1   -->
                                      <BdryAmt>1</BdryAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                      <Incl>true</Incl><!--[1..1] YesNoIndicator boolean  -->
                                  </FrAmt>
                                  <ToAmt><!--[1..1] AmountRangeBoundary1   -->
                                      <BdryAmt>1</BdryAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                      <Incl>true</Incl><!--[1..1] YesNoIndicator boolean  -->
                                  </ToAmt>
                              </FrToAmt>
                              <EQAmt>1</EQAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                              <NEQAmt>1</NEQAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                            </__unresolvedChoice__>
                        </Amt>
                        <CdtDbtInd>CRDT</CdtDbtInd><!--[0..1] CreditDebitCode string  "CRDT"|"DBIT" -->
                        <Ccy>EUR</Ccy><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                    </VldtyRg>
                </Rate>
                <FrToDt><!--[0..1] DateTimePeriodDetails   -->
                    <FrDtTm>2007-06-29T04:30:00Z</FrDtTm><!--[1..1] ISODateTime dateTime  -->
                    <ToDtTm>2007-06-29T04:30:00Z</ToDtTm><!--[1..1] ISODateTime dateTime  -->
                </FrToDt>
                <Rsn>Max35Text</Rsn><!--[0..1] Max35Text string  1..35  -->
            </Intrst>
            <Bal><!--[0..n] CashBalance1   -->
                <Tp><!--[1..1] BalanceType1Choice   -->
                    <__unresolvedChoice__><!--[1..1]    -->
                      <Cd>CCLA</Cd><!--[1..1] BalanceType8Code string  "CCLA"|"CCLB"|"CFWA"|"CITA"|"CITB"|"CLAV"|"CLBD"|"COPA"|"COPB"|"CXPC"|"DCLA"|"DCLB"|"DFWA"|"DITA"|"DITB"|"DOPA"|"DOPB"|"DXPC"|"FWAV"|"ICLA"|"ICLB"|"IFWA"|"IITA"|"IITB"|"IOPA"|"IOPB"|"ITAV"|"ITBD"|"IXPC"|"OPAV"|"OPBD"|"PRCD"|"XPCD" -->
                      <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                    </__unresolvedChoice__>
                </Tp>
                <CdtLine><!--[0..1] CreditLine1   -->
                    <Incl>true</Incl><!--[1..1] TrueFalseIndicator boolean  -->
                    <Amt Ccy="EUR">1</Amt><!--[0..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                          <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                </CdtLine>
                <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                      <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                <CdtDbtInd>CRDT</CdtDbtInd><!--[1..1] CreditDebitCode string  "CRDT"|"DBIT" -->
                <Dt><!--[1..1] DateAndDateTimeChoice   -->
                    <__unresolvedChoice__><!--[1..1]    -->
                      <Dt>2007-06-29</Dt><!--[1..1] ISODate date  -->
                      <DtTm>2007-06-29T04:30:00Z</DtTm><!--[1..1] ISODateTime dateTime  -->
                    </__unresolvedChoice__>
                </Dt>
                <Avlbty><!--[0..n] CashBalanceAvailability1   -->
                    <Dt><!--[1..1] CashBalanceAvailabilityDate1   -->
                        <__unresolvedChoice__><!--[1..1]    -->
                          <NbOfDays>09</NbOfDays><!--[1..1] Max15PlusSignedNumericText string  /[+]{0,1}[0-9]{1,15}/  -->
                          <ActlDt>2007-06-29</ActlDt><!--[1..1] ISODate date  -->
                        </__unresolvedChoice__>
                    </Dt>
                    <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                          <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                    <CdtDbtInd>CRDT</CdtDbtInd><!--[1..1] CreditDebitCode string  "CRDT"|"DBIT" -->
                </Avlbty>
            </Bal>
            <TxsSummry><!--[0..1] TotalTransactions1   -->
                <TtlNtries><!--[0..1] NumberAndSumOfTransactions2   -->
                    <NbOfNtries>09</NbOfNtries><!--[0..1] Max15NumericText string  /[0-9]{1,15}/  -->
                    <Sum>1</Sum><!--[0..1] DecimalNumber decimal  L18.17  -->
                    <TtlNetNtryAmt>1</TtlNetNtryAmt><!--[0..1] DecimalNumber decimal  L18.17  -->
                    <CdtDbtInd>CRDT</CdtDbtInd><!--[0..1] CreditDebitCode string  "CRDT"|"DBIT" -->
                </TtlNtries>
                <TtlCdtNtries><!--[0..1] NumberAndSumOfTransactions1   -->
                    <NbOfNtries>09</NbOfNtries><!--[0..1] Max15NumericText string  /[0-9]{1,15}/  -->
                    <Sum>1</Sum><!--[0..1] DecimalNumber decimal  L18.17  -->
                </TtlCdtNtries>
                <TtlDbtNtries><!--[0..1] NumberAndSumOfTransactions1   -->
                    <NbOfNtries>09</NbOfNtries><!--[0..1] Max15NumericText string  /[0-9]{1,15}/  -->
                    <Sum>1</Sum><!--[0..1] DecimalNumber decimal  L18.17  -->
                </TtlDbtNtries>
                <TtlNtriesPerBkTxCd><!--[0..n] NumberAndSumOfTransactionsPerBankTransactionCode1   -->
                    <NbOfNtries>09</NbOfNtries><!--[0..1] Max15NumericText string  /[0-9]{1,15}/  -->
                    <Sum>1</Sum><!--[0..1] DecimalNumber decimal  L18.17  -->
                    <TtlNetNtryAmt>1</TtlNetNtryAmt><!--[0..1] DecimalNumber decimal  L18.17  -->
                    <CdtDbtInd>CRDT</CdtDbtInd><!--[0..1] CreditDebitCode string  "CRDT"|"DBIT" -->
                    <BkTxCd><!--[1..1] BankTransactionCodeStructure1   -->
                        <Domn><!--[0..1] BankTransactionCodeStructure2   -->
                            <Cd>Exte</Cd><!--[1..1] ExternalBankTransactionDomainCode string  1..4  -->
                            <Fmly><!--[1..1] BankTransactionCodeStructure3   -->
                                <Cd>Exte</Cd><!--[1..1] ExternalBankTransactionFamilyCode string  1..4  -->
                                <SubFmlyCd>Exte</SubFmlyCd><!--[1..1] ExternalBankTransactionSubFamilyCode string  1..4  -->
                            </Fmly>
                        </Domn>
                        <Prtry><!--[0..1] ProprietaryBankTransactionCodeStructure1   -->
                            <Cd>Max35Text</Cd><!--[1..1] Max35Text string  1..35  -->
                            <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                        </Prtry>
                    </BkTxCd>
                    <Avlbty><!--[0..n] CashBalanceAvailability1   -->
                        <Dt><!--[1..1] CashBalanceAvailabilityDate1   -->
                            <__unresolvedChoice__><!--[1..1]    -->
                              <NbOfDays>09</NbOfDays><!--[1..1] Max15PlusSignedNumericText string  /[+]{0,1}[0-9]{1,15}/  -->
                              <ActlDt>2007-06-29</ActlDt><!--[1..1] ISODate date  -->
                            </__unresolvedChoice__>
                        </Dt>
                        <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                              <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        <CdtDbtInd>CRDT</CdtDbtInd><!--[1..1] CreditDebitCode string  "CRDT"|"DBIT" -->
                    </Avlbty>
                </TtlNtriesPerBkTxCd>
            </TxsSummry>
            <Ntry><!--[0..n] ReportEntry1   -->
                <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                      <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                <CdtDbtInd>CRDT</CdtDbtInd><!--[1..1] CreditDebitCode string  "CRDT"|"DBIT" -->
                <RvslInd>true</RvslInd><!--[0..1] TrueFalseIndicator boolean  -->
                <Sts>BOOK</Sts><!--[1..1] EntryStatus2Code string  "BOOK"|"INFO"|"PDNG" -->
                <BookgDt><!--[0..1] DateAndDateTimeChoice   -->
                    <__unresolvedChoice__><!--[1..1]    -->
                      <Dt>2007-06-29</Dt><!--[1..1] ISODate date  -->
                      <DtTm>2007-06-29T04:30:00Z</DtTm><!--[1..1] ISODateTime dateTime  -->
                    </__unresolvedChoice__>
                </BookgDt>
                <ValDt><!--[0..1] DateAndDateTimeChoice   -->
                    <__unresolvedChoice__><!--[1..1]    -->
                      <Dt>2007-06-29</Dt><!--[1..1] ISODate date  -->
                      <DtTm>2007-06-29T04:30:00Z</DtTm><!--[1..1] ISODateTime dateTime  -->
                    </__unresolvedChoice__>
                </ValDt>
                <AcctSvcrRef>Max35Text</AcctSvcrRef><!--[0..1] Max35Text string  1..35  -->
                <Avlbty><!--[0..n] CashBalanceAvailability1   -->
                    <Dt><!--[1..1] CashBalanceAvailabilityDate1   -->
                        <__unresolvedChoice__><!--[1..1]    -->
                          <NbOfDays>09</NbOfDays><!--[1..1] Max15PlusSignedNumericText string  /[+]{0,1}[0-9]{1,15}/  -->
                          <ActlDt>2007-06-29</ActlDt><!--[1..1] ISODate date  -->
                        </__unresolvedChoice__>
                    </Dt>
                    <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                          <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                    <CdtDbtInd>CRDT</CdtDbtInd><!--[1..1] CreditDebitCode string  "CRDT"|"DBIT" -->
                </Avlbty>
                <BkTxCd><!--[1..1] BankTransactionCodeStructure1   -->
                    <Domn><!--[0..1] BankTransactionCodeStructure2   -->
                        <Cd>Exte</Cd><!--[1..1] ExternalBankTransactionDomainCode string  1..4  -->
                        <Fmly><!--[1..1] BankTransactionCodeStructure3   -->
                            <Cd>Exte</Cd><!--[1..1] ExternalBankTransactionFamilyCode string  1..4  -->
                            <SubFmlyCd>Exte</SubFmlyCd><!--[1..1] ExternalBankTransactionSubFamilyCode string  1..4  -->
                        </Fmly>
                    </Domn>
                    <Prtry><!--[0..1] ProprietaryBankTransactionCodeStructure1   -->
                        <Cd>Max35Text</Cd><!--[1..1] Max35Text string  1..35  -->
                        <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                    </Prtry>
                </BkTxCd>
                <ComssnWvrInd>true</ComssnWvrInd><!--[0..1] YesNoIndicator boolean  -->
                <AddtlInfInd><!--[0..1] MessageIdentification2   -->
                    <MsgNmId>Max35Text</MsgNmId><!--[0..1] Max35Text string  1..35  -->
                    <MsgId>Max35Text</MsgId><!--[0..1] Max35Text string  1..35  -->
                </AddtlInfInd>
                <Btch><!--[0..n] BatchInformation1   -->
                    <MsgId>Max35Text</MsgId><!--[0..1] Max35Text string  1..35  -->
                    <PmtInfId>Max35Text</PmtInfId><!--[0..1] Max35Text string  1..35  -->
                    <NbOfTxs>09</NbOfTxs><!--[0..1] Max15NumericText string  /[0-9]{1,15}/  -->
                </Btch>
                <AmtDtls><!--[0..1] AmountAndCurrencyExchange2   -->
                    <InstdAmt><!--[0..1] AmountAndCurrencyExchangeDetails1   -->
                        <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                              <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        <CcyXchg><!--[0..1] CurrencyExchange3   -->
                            <SrcCcy>EUR</SrcCcy><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <TrgtCcy>EUR</TrgtCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <UnitCcy>EUR</UnitCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <XchgRate>1</XchgRate><!--[1..1] BaseOneRate decimal  L11.10  -->
                            <CtrctId>Max35Text</CtrctId><!--[0..1] Max35Text string  1..35  -->
                            <QtnDt>2007-06-29T04:30:00Z</QtnDt><!--[0..1] ISODateTime dateTime  -->
                        </CcyXchg>
                    </InstdAmt>
                    <TxAmt><!--[0..1] AmountAndCurrencyExchangeDetails1   -->
                        <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                              <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        <CcyXchg><!--[0..1] CurrencyExchange3   -->
                            <SrcCcy>EUR</SrcCcy><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <TrgtCcy>EUR</TrgtCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <UnitCcy>EUR</UnitCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <XchgRate>1</XchgRate><!--[1..1] BaseOneRate decimal  L11.10  -->
                            <CtrctId>Max35Text</CtrctId><!--[0..1] Max35Text string  1..35  -->
                            <QtnDt>2007-06-29T04:30:00Z</QtnDt><!--[0..1] ISODateTime dateTime  -->
                        </CcyXchg>
                    </TxAmt>
                    <CntrValAmt><!--[0..1] AmountAndCurrencyExchangeDetails1   -->
                        <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                              <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        <CcyXchg><!--[0..1] CurrencyExchange3   -->
                            <SrcCcy>EUR</SrcCcy><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <TrgtCcy>EUR</TrgtCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <UnitCcy>EUR</UnitCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <XchgRate>1</XchgRate><!--[1..1] BaseOneRate decimal  L11.10  -->
                            <CtrctId>Max35Text</CtrctId><!--[0..1] Max35Text string  1..35  -->
                            <QtnDt>2007-06-29T04:30:00Z</QtnDt><!--[0..1] ISODateTime dateTime  -->
                        </CcyXchg>
                    </CntrValAmt>
                    <AnncdPstngAmt><!--[0..1] AmountAndCurrencyExchangeDetails1   -->
                        <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                              <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        <CcyXchg><!--[0..1] CurrencyExchange3   -->
                            <SrcCcy>EUR</SrcCcy><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <TrgtCcy>EUR</TrgtCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <UnitCcy>EUR</UnitCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <XchgRate>1</XchgRate><!--[1..1] BaseOneRate decimal  L11.10  -->
                            <CtrctId>Max35Text</CtrctId><!--[0..1] Max35Text string  1..35  -->
                            <QtnDt>2007-06-29T04:30:00Z</QtnDt><!--[0..1] ISODateTime dateTime  -->
                        </CcyXchg>
                    </AnncdPstngAmt>
                    <PrtryAmt><!--[0..n] AmountAndCurrencyExchangeDetails2   -->
                        <Tp>Max35Text</Tp><!--[1..1] Max35Text string  1..35  -->
                        <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                              <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        <CcyXchg><!--[0..1] CurrencyExchange3   -->
                            <SrcCcy>EUR</SrcCcy><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <TrgtCcy>EUR</TrgtCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <UnitCcy>EUR</UnitCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <XchgRate>1</XchgRate><!--[1..1] BaseOneRate decimal  L11.10  -->
                            <CtrctId>Max35Text</CtrctId><!--[0..1] Max35Text string  1..35  -->
                            <QtnDt>2007-06-29T04:30:00Z</QtnDt><!--[0..1] ISODateTime dateTime  -->
                        </CcyXchg>
                    </PrtryAmt>
                </AmtDtls>
                <Chrgs><!--[0..n] ChargesInformation3   -->
                    <TtlChrgsAndTaxAmt Ccy="EUR">1</TtlChrgsAndTaxAmt><!--[0..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                          <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                    <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                          <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                    <Tp><!--[0..1] ChargeTypeChoice   -->
                        <__unresolvedChoice__><!--[1..1]    -->
                          <Cd>BRKF</Cd><!--[1..1] ChargeType1Code string  "BRKF"|"COMM" -->
                          <PrtryCd>azAZ</PrtryCd><!--[1..1] Max4AlphaNumericText string  /[a-zA-Z0-9]{1,4}/  -->
                        </__unresolvedChoice__>
                    </Tp>
                    <Rate>1</Rate><!--[0..1] PercentageRate decimal  L11.10  -->
                    <Br>CRED</Br><!--[0..1] ChargeBearerType1Code string  "CRED"|"DEBT"|"SHAR"|"SLEV" -->
                    <Pty><!--[0..1] BranchAndFinancialInstitutionIdentification3   -->
                        <FinInstnId><!--[1..1] FinancialInstitutionIdentification5Choice   -->
                            <__unresolvedChoice__><!--[1..1]    -->
                              <BIC>COBADEFF</BIC><!--[1..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                              <ClrSysMmbId><!--[1..1] ClearingSystemMemberIdentification3Choice   -->
                                  <__unresolvedChoice__><!--[1..1]    -->
                                    <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                    <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                  </__unresolvedChoice__>
                              </ClrSysMmbId>
                              <NmAndAdr><!--[1..1] NameAndAddress7   -->
                                  <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                                  <PstlAdr><!--[1..1] PostalAddress1   -->
                                      <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                      <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                      <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                      <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                      <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                      <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                      <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                      <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                  </PstlAdr>
                              </NmAndAdr>
                              <PrtryId><!--[1..1] GenericIdentification3   -->
                                  <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                  <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                              </PrtryId>
                              <CmbndId><!--[1..1] FinancialInstitutionIdentification3   -->
                                  <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                  <ClrSysMmbId><!--[0..1] ClearingSystemMemberIdentification3Choice   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                        <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                      </__unresolvedChoice__>
                                  </ClrSysMmbId>
                                  <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                  <PstlAdr><!--[0..1] PostalAddress1   -->
                                      <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                      <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                      <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                      <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                      <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                      <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                      <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                      <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                  </PstlAdr>
                                  <PrtryId><!--[0..1] GenericIdentification3   -->
                                      <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrtryId>
                              </CmbndId>
                            </__unresolvedChoice__>
                        </FinInstnId>
                        <BrnchId><!--[0..1] BranchData   -->
                            <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                            <Nm>Max35Text</Nm><!--[0..1] Max35Text string  1..35  -->
                            <PstlAdr><!--[0..1] PostalAddress1   -->
                                <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                            </PstlAdr>
                        </BrnchId>
                    </Pty>
                    <Tax><!--[0..1] TaxCharges1   -->
                        <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                        <Rate>1</Rate><!--[0..1] PercentageRate decimal  L11.10  -->
                        <Amt Ccy="EUR">1</Amt><!--[0..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                              <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                    </Tax>
                </Chrgs>
                <Intrst><!--[0..n] TransactionInterest1   -->
                    <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                          <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                    <CdtDbtInd>CRDT</CdtDbtInd><!--[1..1] CreditDebitCode string  "CRDT"|"DBIT" -->
                    <Tp><!--[0..1] InterestType1Choice   -->
                        <__unresolvedChoice__><!--[1..1]    -->
                          <Cd>INDY</Cd><!--[1..1] InterestType1Code string  "INDY"|"OVRN" -->
                          <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                        </__unresolvedChoice__>
                    </Tp>
                    <Rate><!--[0..n] Rate1   -->
                        <Rate><!--[1..1] RateTypeChoice   -->
                            <__unresolvedChoice__><!--[1..1]    -->
                              <PctgRate>1</PctgRate><!--[1..1] PercentageRate decimal  L11.10  -->
                              <TxtlRate>Max35Text</TxtlRate><!--[1..1] Max35Text string  1..35  -->
                            </__unresolvedChoice__>
                        </Rate>
                        <VldtyRg><!--[0..1] CurrencyAndAmountRange   -->
                            <Amt><!--[1..1] ImpliedCurrencyAmountRangeChoice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <FrAmt><!--[1..1] AmountRangeBoundary1   -->
                                      <BdryAmt>1</BdryAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                      <Incl>true</Incl><!--[1..1] YesNoIndicator boolean  -->
                                  </FrAmt>
                                  <ToAmt><!--[1..1] AmountRangeBoundary1   -->
                                      <BdryAmt>1</BdryAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                      <Incl>true</Incl><!--[1..1] YesNoIndicator boolean  -->
                                  </ToAmt>
                                  <FrToAmt><!--[1..1] FromToAmountRange   -->
                                      <FrAmt><!--[1..1] AmountRangeBoundary1   -->
                                          <BdryAmt>1</BdryAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                          <Incl>true</Incl><!--[1..1] YesNoIndicator boolean  -->
                                      </FrAmt>
                                      <ToAmt><!--[1..1] AmountRangeBoundary1   -->
                                          <BdryAmt>1</BdryAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                          <Incl>true</Incl><!--[1..1] YesNoIndicator boolean  -->
                                      </ToAmt>
                                  </FrToAmt>
                                  <EQAmt>1</EQAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                  <NEQAmt>1</NEQAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                </__unresolvedChoice__>
                            </Amt>
                            <CdtDbtInd>CRDT</CdtDbtInd><!--[0..1] CreditDebitCode string  "CRDT"|"DBIT" -->
                            <Ccy>EUR</Ccy><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        </VldtyRg>
                    </Rate>
                    <FrToDt><!--[0..1] DateTimePeriodDetails   -->
                        <FrDtTm>2007-06-29T04:30:00Z</FrDtTm><!--[1..1] ISODateTime dateTime  -->
                        <ToDtTm>2007-06-29T04:30:00Z</ToDtTm><!--[1..1] ISODateTime dateTime  -->
                    </FrToDt>
                    <Rsn>Max35Text</Rsn><!--[0..1] Max35Text string  1..35  -->
                </Intrst>
                <TxDtls><!--[0..n] EntryTransaction1   -->
                    <Refs><!--[0..1] TransactionReferences1   -->
                        <MsgId>Max35Text</MsgId><!--[0..1] Max35Text string  1..35  -->
                        <AcctSvcrRef>Max35Text</AcctSvcrRef><!--[0..1] Max35Text string  1..35  -->
                        <InstrId>Max35Text</InstrId><!--[0..1] Max35Text string  1..35  -->
                        <EndToEndId>Max35Text</EndToEndId><!--[0..1] Max35Text string  1..35  -->
                        <TxId>Max35Text</TxId><!--[0..1] Max35Text string  1..35  -->
                        <MndtId>Max35Text</MndtId><!--[0..1] Max35Text string  1..35  -->
                        <ChqNb>Max35Text</ChqNb><!--[0..1] Max35Text string  1..35  -->
                        <ClrSysRef>Max35Text</ClrSysRef><!--[0..1] Max35Text string  1..35  -->
                        <Prtry><!--[0..1] ProprietaryReference1   -->
                            <Tp>Max35Text</Tp><!--[1..1] Max35Text string  1..35  -->
                            <Ref>Max35Text</Ref><!--[1..1] Max35Text string  1..35  -->
                        </Prtry>
                    </Refs>
                    <AmtDtls><!--[0..1] AmountAndCurrencyExchange2   -->
                        <InstdAmt><!--[0..1] AmountAndCurrencyExchangeDetails1   -->
                            <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                  <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <CcyXchg><!--[0..1] CurrencyExchange3   -->
                                <SrcCcy>EUR</SrcCcy><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <TrgtCcy>EUR</TrgtCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <UnitCcy>EUR</UnitCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <XchgRate>1</XchgRate><!--[1..1] BaseOneRate decimal  L11.10  -->
                                <CtrctId>Max35Text</CtrctId><!--[0..1] Max35Text string  1..35  -->
                                <QtnDt>2007-06-29T04:30:00Z</QtnDt><!--[0..1] ISODateTime dateTime  -->
                            </CcyXchg>
                        </InstdAmt>
                        <TxAmt><!--[0..1] AmountAndCurrencyExchangeDetails1   -->
                            <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                  <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <CcyXchg><!--[0..1] CurrencyExchange3   -->
                                <SrcCcy>EUR</SrcCcy><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <TrgtCcy>EUR</TrgtCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <UnitCcy>EUR</UnitCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <XchgRate>1</XchgRate><!--[1..1] BaseOneRate decimal  L11.10  -->
                                <CtrctId>Max35Text</CtrctId><!--[0..1] Max35Text string  1..35  -->
                                <QtnDt>2007-06-29T04:30:00Z</QtnDt><!--[0..1] ISODateTime dateTime  -->
                            </CcyXchg>
                        </TxAmt>
                        <CntrValAmt><!--[0..1] AmountAndCurrencyExchangeDetails1   -->
                            <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                  <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <CcyXchg><!--[0..1] CurrencyExchange3   -->
                                <SrcCcy>EUR</SrcCcy><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <TrgtCcy>EUR</TrgtCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <UnitCcy>EUR</UnitCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <XchgRate>1</XchgRate><!--[1..1] BaseOneRate decimal  L11.10  -->
                                <CtrctId>Max35Text</CtrctId><!--[0..1] Max35Text string  1..35  -->
                                <QtnDt>2007-06-29T04:30:00Z</QtnDt><!--[0..1] ISODateTime dateTime  -->
                            </CcyXchg>
                        </CntrValAmt>
                        <AnncdPstngAmt><!--[0..1] AmountAndCurrencyExchangeDetails1   -->
                            <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                  <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <CcyXchg><!--[0..1] CurrencyExchange3   -->
                                <SrcCcy>EUR</SrcCcy><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <TrgtCcy>EUR</TrgtCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <UnitCcy>EUR</UnitCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <XchgRate>1</XchgRate><!--[1..1] BaseOneRate decimal  L11.10  -->
                                <CtrctId>Max35Text</CtrctId><!--[0..1] Max35Text string  1..35  -->
                                <QtnDt>2007-06-29T04:30:00Z</QtnDt><!--[0..1] ISODateTime dateTime  -->
                            </CcyXchg>
                        </AnncdPstngAmt>
                        <PrtryAmt><!--[0..n] AmountAndCurrencyExchangeDetails2   -->
                            <Tp>Max35Text</Tp><!--[1..1] Max35Text string  1..35  -->
                            <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                  <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <CcyXchg><!--[0..1] CurrencyExchange3   -->
                                <SrcCcy>EUR</SrcCcy><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <TrgtCcy>EUR</TrgtCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <UnitCcy>EUR</UnitCcy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <XchgRate>1</XchgRate><!--[1..1] BaseOneRate decimal  L11.10  -->
                                <CtrctId>Max35Text</CtrctId><!--[0..1] Max35Text string  1..35  -->
                                <QtnDt>2007-06-29T04:30:00Z</QtnDt><!--[0..1] ISODateTime dateTime  -->
                            </CcyXchg>
                        </PrtryAmt>
                    </AmtDtls>
                    <Avlbty><!--[0..n] CashBalanceAvailability1   -->
                        <Dt><!--[1..1] CashBalanceAvailabilityDate1   -->
                            <__unresolvedChoice__><!--[1..1]    -->
                              <NbOfDays>09</NbOfDays><!--[1..1] Max15PlusSignedNumericText string  /[+]{0,1}[0-9]{1,15}/  -->
                              <ActlDt>2007-06-29</ActlDt><!--[1..1] ISODate date  -->
                            </__unresolvedChoice__>
                        </Dt>
                        <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                              <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        <CdtDbtInd>CRDT</CdtDbtInd><!--[1..1] CreditDebitCode string  "CRDT"|"DBIT" -->
                    </Avlbty>
                    <BkTxCd><!--[0..1] BankTransactionCodeStructure1   -->
                        <Domn><!--[0..1] BankTransactionCodeStructure2   -->
                            <Cd>Exte</Cd><!--[1..1] ExternalBankTransactionDomainCode string  1..4  -->
                            <Fmly><!--[1..1] BankTransactionCodeStructure3   -->
                                <Cd>Exte</Cd><!--[1..1] ExternalBankTransactionFamilyCode string  1..4  -->
                                <SubFmlyCd>Exte</SubFmlyCd><!--[1..1] ExternalBankTransactionSubFamilyCode string  1..4  -->
                            </Fmly>
                        </Domn>
                        <Prtry><!--[0..1] ProprietaryBankTransactionCodeStructure1   -->
                            <Cd>Max35Text</Cd><!--[1..1] Max35Text string  1..35  -->
                            <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                        </Prtry>
                    </BkTxCd>
                    <Chrgs><!--[0..n] ChargesInformation3   -->
                        <TtlChrgsAndTaxAmt Ccy="EUR">1</TtlChrgsAndTaxAmt><!--[0..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                              <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                              <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        <Tp><!--[0..1] ChargeTypeChoice   -->
                            <__unresolvedChoice__><!--[1..1]    -->
                              <Cd>BRKF</Cd><!--[1..1] ChargeType1Code string  "BRKF"|"COMM" -->
                              <PrtryCd>azAZ</PrtryCd><!--[1..1] Max4AlphaNumericText string  /[a-zA-Z0-9]{1,4}/  -->
                            </__unresolvedChoice__>
                        </Tp>
                        <Rate>1</Rate><!--[0..1] PercentageRate decimal  L11.10  -->
                        <Br>CRED</Br><!--[0..1] ChargeBearerType1Code string  "CRED"|"DEBT"|"SHAR"|"SLEV" -->
                        <Pty><!--[0..1] BranchAndFinancialInstitutionIdentification3   -->
                            <FinInstnId><!--[1..1] FinancialInstitutionIdentification5Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <BIC>COBADEFF</BIC><!--[1..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                  <ClrSysMmbId><!--[1..1] ClearingSystemMemberIdentification3Choice   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                        <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                      </__unresolvedChoice__>
                                  </ClrSysMmbId>
                                  <NmAndAdr><!--[1..1] NameAndAddress7   -->
                                      <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[1..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                  </NmAndAdr>
                                  <PrtryId><!--[1..1] GenericIdentification3   -->
                                      <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrtryId>
                                  <CmbndId><!--[1..1] FinancialInstitutionIdentification3   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <ClrSysMmbId><!--[0..1] ClearingSystemMemberIdentification3Choice   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                            <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                          </__unresolvedChoice__>
                                      </ClrSysMmbId>
                                      <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[0..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </CmbndId>
                                </__unresolvedChoice__>
                            </FinInstnId>
                            <BrnchId><!--[0..1] BranchData   -->
                                <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                                <Nm>Max35Text</Nm><!--[0..1] Max35Text string  1..35  -->
                                <PstlAdr><!--[0..1] PostalAddress1   -->
                                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </PstlAdr>
                            </BrnchId>
                        </Pty>
                        <Tax><!--[0..1] TaxCharges1   -->
                            <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                            <Rate>1</Rate><!--[0..1] PercentageRate decimal  L11.10  -->
                            <Amt Ccy="EUR">1</Amt><!--[0..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                  <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        </Tax>
                    </Chrgs>
                    <Intrst><!--[0..n] TransactionInterest1   -->
                        <Amt Ccy="EUR">1</Amt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                              <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        <CdtDbtInd>CRDT</CdtDbtInd><!--[1..1] CreditDebitCode string  "CRDT"|"DBIT" -->
                        <Tp><!--[0..1] InterestType1Choice   -->
                            <__unresolvedChoice__><!--[1..1]    -->
                              <Cd>INDY</Cd><!--[1..1] InterestType1Code string  "INDY"|"OVRN" -->
                              <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                            </__unresolvedChoice__>
                        </Tp>
                        <Rate><!--[0..n] Rate1   -->
                            <Rate><!--[1..1] RateTypeChoice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <PctgRate>1</PctgRate><!--[1..1] PercentageRate decimal  L11.10  -->
                                  <TxtlRate>Max35Text</TxtlRate><!--[1..1] Max35Text string  1..35  -->
                                </__unresolvedChoice__>
                            </Rate>
                            <VldtyRg><!--[0..1] CurrencyAndAmountRange   -->
                                <Amt><!--[1..1] ImpliedCurrencyAmountRangeChoice   -->
                                    <__unresolvedChoice__><!--[1..1]    -->
                                      <FrAmt><!--[1..1] AmountRangeBoundary1   -->
                                          <BdryAmt>1</BdryAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                          <Incl>true</Incl><!--[1..1] YesNoIndicator boolean  -->
                                      </FrAmt>
                                      <ToAmt><!--[1..1] AmountRangeBoundary1   -->
                                          <BdryAmt>1</BdryAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                          <Incl>true</Incl><!--[1..1] YesNoIndicator boolean  -->
                                      </ToAmt>
                                      <FrToAmt><!--[1..1] FromToAmountRange   -->
                                          <FrAmt><!--[1..1] AmountRangeBoundary1   -->
                                              <BdryAmt>1</BdryAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                              <Incl>true</Incl><!--[1..1] YesNoIndicator boolean  -->
                                          </FrAmt>
                                          <ToAmt><!--[1..1] AmountRangeBoundary1   -->
                                              <BdryAmt>1</BdryAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                              <Incl>true</Incl><!--[1..1] YesNoIndicator boolean  -->
                                          </ToAmt>
                                      </FrToAmt>
                                      <EQAmt>1</EQAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                      <NEQAmt>1</NEQAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                    </__unresolvedChoice__>
                                </Amt>
                                <CdtDbtInd>CRDT</CdtDbtInd><!--[0..1] CreditDebitCode string  "CRDT"|"DBIT" -->
                                <Ccy>EUR</Ccy><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            </VldtyRg>
                        </Rate>
                        <FrToDt><!--[0..1] DateTimePeriodDetails   -->
                            <FrDtTm>2007-06-29T04:30:00Z</FrDtTm><!--[1..1] ISODateTime dateTime  -->
                            <ToDtTm>2007-06-29T04:30:00Z</ToDtTm><!--[1..1] ISODateTime dateTime  -->
                        </FrToDt>
                        <Rsn>Max35Text</Rsn><!--[0..1] Max35Text string  1..35  -->
                    </Intrst>
                    <RltdPties><!--[0..1] TransactionParty1   -->
                        <InitgPty><!--[0..1] PartyIdentification8   -->
                            <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                            <PstlAdr><!--[0..1] PostalAddress1   -->
                                <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                            </PstlAdr>
                            <Id><!--[0..1] Party2Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <OrgId><!--[1..1] OrganisationIdentification2   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <IBEI>AZBDFHJNP0</IBEI><!--[0..1] IBEIIdentifier string  /[A-Z]{2,2}[B-DF-HJ-NP-TV-XZ0-9]{7,7}[0-9]{1,1}/  -->
                                      <BEI>BEIADEFF</BEI><!--[0..1] BEIIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <EANGLN>0909090909090</EANGLN><!--[0..1] EANGLNIdentifier string  /[0-9]{13,13}/  -->
                                      <USCHU>CH012345</USCHU><!--[0..1] CHIPSUniversalIdentifier string  /CH[0-9]{6,6}/  -->
                                      <DUNS>090909090</DUNS><!--[0..1] DunsIdentifier string  /[0-9]{9,9}/  -->
                                      <BkPtyId>Max35Text</BkPtyId><!--[0..1] Max35Text string  1..35  -->
                                      <TaxIdNb>Max35Text</TaxIdNb><!--[0..1] Max35Text string  1..35  -->
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </OrgId>
                                  <PrvtId><!--[1..4] PersonIdentification3   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <DrvrsLicNb>Max35Text</DrvrsLicNb><!--[1..1] Max35Text string  1..35  -->
                                        <CstmrNb>Max35Text</CstmrNb><!--[1..1] Max35Text string  1..35  -->
                                        <SclSctyNb>Max35Text</SclSctyNb><!--[1..1] Max35Text string  1..35  -->
                                        <AlnRegnNb>Max35Text</AlnRegnNb><!--[1..1] Max35Text string  1..35  -->
                                        <PsptNb>Max35Text</PsptNb><!--[1..1] Max35Text string  1..35  -->
                                        <TaxIdNb>Max35Text</TaxIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <IdntyCardNb>Max35Text</IdntyCardNb><!--[1..1] Max35Text string  1..35  -->
                                        <MplyrIdNb>Max35Text</MplyrIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <DtAndPlcOfBirth><!--[1..1] DateAndPlaceOfBirth   -->
                                            <BirthDt>2007-06-29</BirthDt><!--[1..1] ISODate date  -->
                                            <PrvcOfBirth>Max35Text</PrvcOfBirth><!--[0..1] Max35Text string  1..35  -->
                                            <CityOfBirth>Max35Text</CityOfBirth><!--[1..1] Max35Text string  1..35  -->
                                            <CtryOfBirth>AZ</CtryOfBirth><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                        </DtAndPlcOfBirth>
                                        <OthrId><!--[1..1] GenericIdentification4   -->
                                            <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                            <IdTp>Max35Text</IdTp><!--[1..1] Max35Text string  1..35  -->
                                        </OthrId>
                                      </__unresolvedChoice__>
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrvtId>
                                </__unresolvedChoice__>
                            </Id>
                            <CtryOfRes>AZ</CtryOfRes><!--[0..1] CountryCode string  /[A-Z]{2,2}/  -->
                        </InitgPty>
                        <Dbtr><!--[0..1] PartyIdentification8   -->
                            <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                            <PstlAdr><!--[0..1] PostalAddress1   -->
                                <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                            </PstlAdr>
                            <Id><!--[0..1] Party2Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <OrgId><!--[1..1] OrganisationIdentification2   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <IBEI>AZBDFHJNP0</IBEI><!--[0..1] IBEIIdentifier string  /[A-Z]{2,2}[B-DF-HJ-NP-TV-XZ0-9]{7,7}[0-9]{1,1}/  -->
                                      <BEI>BEIADEFF</BEI><!--[0..1] BEIIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <EANGLN>0909090909090</EANGLN><!--[0..1] EANGLNIdentifier string  /[0-9]{13,13}/  -->
                                      <USCHU>CH012345</USCHU><!--[0..1] CHIPSUniversalIdentifier string  /CH[0-9]{6,6}/  -->
                                      <DUNS>090909090</DUNS><!--[0..1] DunsIdentifier string  /[0-9]{9,9}/  -->
                                      <BkPtyId>Max35Text</BkPtyId><!--[0..1] Max35Text string  1..35  -->
                                      <TaxIdNb>Max35Text</TaxIdNb><!--[0..1] Max35Text string  1..35  -->
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </OrgId>
                                  <PrvtId><!--[1..4] PersonIdentification3   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <DrvrsLicNb>Max35Text</DrvrsLicNb><!--[1..1] Max35Text string  1..35  -->
                                        <CstmrNb>Max35Text</CstmrNb><!--[1..1] Max35Text string  1..35  -->
                                        <SclSctyNb>Max35Text</SclSctyNb><!--[1..1] Max35Text string  1..35  -->
                                        <AlnRegnNb>Max35Text</AlnRegnNb><!--[1..1] Max35Text string  1..35  -->
                                        <PsptNb>Max35Text</PsptNb><!--[1..1] Max35Text string  1..35  -->
                                        <TaxIdNb>Max35Text</TaxIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <IdntyCardNb>Max35Text</IdntyCardNb><!--[1..1] Max35Text string  1..35  -->
                                        <MplyrIdNb>Max35Text</MplyrIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <DtAndPlcOfBirth><!--[1..1] DateAndPlaceOfBirth   -->
                                            <BirthDt>2007-06-29</BirthDt><!--[1..1] ISODate date  -->
                                            <PrvcOfBirth>Max35Text</PrvcOfBirth><!--[0..1] Max35Text string  1..35  -->
                                            <CityOfBirth>Max35Text</CityOfBirth><!--[1..1] Max35Text string  1..35  -->
                                            <CtryOfBirth>AZ</CtryOfBirth><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                        </DtAndPlcOfBirth>
                                        <OthrId><!--[1..1] GenericIdentification4   -->
                                            <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                            <IdTp>Max35Text</IdTp><!--[1..1] Max35Text string  1..35  -->
                                        </OthrId>
                                      </__unresolvedChoice__>
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrvtId>
                                </__unresolvedChoice__>
                            </Id>
                            <CtryOfRes>AZ</CtryOfRes><!--[0..1] CountryCode string  /[A-Z]{2,2}/  -->
                        </Dbtr>
                        <DbtrAcct><!--[0..1] CashAccount7   -->
                            <Id><!--[1..1] AccountIdentification3Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <IBAN>DE28500400000123456589</IBAN><!--[1..1] IBANIdentifier string  /[a-zA-Z]{2,2}[0-9]{2,2}[a-zA-Z0-9]{1,30}/  -->
                                  <BBAN>azAZ09</BBAN><!--[1..1] BBANIdentifier string  /[a-zA-Z0-9]{1,30}/  -->
                                  <UPIC>09090909</UPIC><!--[1..1] UPICIdentifier string  /[0-9]{8,17}/  -->
                                  <PrtryAcct><!--[1..1] SimpleIdentificationInformation2   -->
                                      <Id>Max34Text</Id><!--[1..1] Max34Text string  1..34  -->
                                  </PrtryAcct>
                                </__unresolvedChoice__>
                            </Id>
                            <Tp><!--[0..1] CashAccountType2   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <Cd>CACC</Cd><!--[1..1] CashAccountType4Code string  "CACC"|"CASH"|"CHAR"|"CISH"|"COMM"|"LOAN"|"MGLD"|"MOMA"|"NREX"|"ODFT"|"ONDP"|"SACC"|"SLRY"|"SVGS"|"TAXE"|"TRAS" -->
                                  <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                </__unresolvedChoice__>
                            </Tp>
                            <Ccy>EUR</Ccy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                        </DbtrAcct>
                        <UltmtDbtr><!--[0..1] PartyIdentification8   -->
                            <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                            <PstlAdr><!--[0..1] PostalAddress1   -->
                                <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                            </PstlAdr>
                            <Id><!--[0..1] Party2Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <OrgId><!--[1..1] OrganisationIdentification2   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <IBEI>AZBDFHJNP0</IBEI><!--[0..1] IBEIIdentifier string  /[A-Z]{2,2}[B-DF-HJ-NP-TV-XZ0-9]{7,7}[0-9]{1,1}/  -->
                                      <BEI>BEIADEFF</BEI><!--[0..1] BEIIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <EANGLN>0909090909090</EANGLN><!--[0..1] EANGLNIdentifier string  /[0-9]{13,13}/  -->
                                      <USCHU>CH012345</USCHU><!--[0..1] CHIPSUniversalIdentifier string  /CH[0-9]{6,6}/  -->
                                      <DUNS>090909090</DUNS><!--[0..1] DunsIdentifier string  /[0-9]{9,9}/  -->
                                      <BkPtyId>Max35Text</BkPtyId><!--[0..1] Max35Text string  1..35  -->
                                      <TaxIdNb>Max35Text</TaxIdNb><!--[0..1] Max35Text string  1..35  -->
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </OrgId>
                                  <PrvtId><!--[1..4] PersonIdentification3   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <DrvrsLicNb>Max35Text</DrvrsLicNb><!--[1..1] Max35Text string  1..35  -->
                                        <CstmrNb>Max35Text</CstmrNb><!--[1..1] Max35Text string  1..35  -->
                                        <SclSctyNb>Max35Text</SclSctyNb><!--[1..1] Max35Text string  1..35  -->
                                        <AlnRegnNb>Max35Text</AlnRegnNb><!--[1..1] Max35Text string  1..35  -->
                                        <PsptNb>Max35Text</PsptNb><!--[1..1] Max35Text string  1..35  -->
                                        <TaxIdNb>Max35Text</TaxIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <IdntyCardNb>Max35Text</IdntyCardNb><!--[1..1] Max35Text string  1..35  -->
                                        <MplyrIdNb>Max35Text</MplyrIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <DtAndPlcOfBirth><!--[1..1] DateAndPlaceOfBirth   -->
                                            <BirthDt>2007-06-29</BirthDt><!--[1..1] ISODate date  -->
                                            <PrvcOfBirth>Max35Text</PrvcOfBirth><!--[0..1] Max35Text string  1..35  -->
                                            <CityOfBirth>Max35Text</CityOfBirth><!--[1..1] Max35Text string  1..35  -->
                                            <CtryOfBirth>AZ</CtryOfBirth><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                        </DtAndPlcOfBirth>
                                        <OthrId><!--[1..1] GenericIdentification4   -->
                                            <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                            <IdTp>Max35Text</IdTp><!--[1..1] Max35Text string  1..35  -->
                                        </OthrId>
                                      </__unresolvedChoice__>
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrvtId>
                                </__unresolvedChoice__>
                            </Id>
                            <CtryOfRes>AZ</CtryOfRes><!--[0..1] CountryCode string  /[A-Z]{2,2}/  -->
                        </UltmtDbtr>
                        <Cdtr><!--[0..1] PartyIdentification8   -->
                            <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                            <PstlAdr><!--[0..1] PostalAddress1   -->
                                <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                            </PstlAdr>
                            <Id><!--[0..1] Party2Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <OrgId><!--[1..1] OrganisationIdentification2   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <IBEI>AZBDFHJNP0</IBEI><!--[0..1] IBEIIdentifier string  /[A-Z]{2,2}[B-DF-HJ-NP-TV-XZ0-9]{7,7}[0-9]{1,1}/  -->
                                      <BEI>BEIADEFF</BEI><!--[0..1] BEIIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <EANGLN>0909090909090</EANGLN><!--[0..1] EANGLNIdentifier string  /[0-9]{13,13}/  -->
                                      <USCHU>CH012345</USCHU><!--[0..1] CHIPSUniversalIdentifier string  /CH[0-9]{6,6}/  -->
                                      <DUNS>090909090</DUNS><!--[0..1] DunsIdentifier string  /[0-9]{9,9}/  -->
                                      <BkPtyId>Max35Text</BkPtyId><!--[0..1] Max35Text string  1..35  -->
                                      <TaxIdNb>Max35Text</TaxIdNb><!--[0..1] Max35Text string  1..35  -->
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </OrgId>
                                  <PrvtId><!--[1..4] PersonIdentification3   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <DrvrsLicNb>Max35Text</DrvrsLicNb><!--[1..1] Max35Text string  1..35  -->
                                        <CstmrNb>Max35Text</CstmrNb><!--[1..1] Max35Text string  1..35  -->
                                        <SclSctyNb>Max35Text</SclSctyNb><!--[1..1] Max35Text string  1..35  -->
                                        <AlnRegnNb>Max35Text</AlnRegnNb><!--[1..1] Max35Text string  1..35  -->
                                        <PsptNb>Max35Text</PsptNb><!--[1..1] Max35Text string  1..35  -->
                                        <TaxIdNb>Max35Text</TaxIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <IdntyCardNb>Max35Text</IdntyCardNb><!--[1..1] Max35Text string  1..35  -->
                                        <MplyrIdNb>Max35Text</MplyrIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <DtAndPlcOfBirth><!--[1..1] DateAndPlaceOfBirth   -->
                                            <BirthDt>2007-06-29</BirthDt><!--[1..1] ISODate date  -->
                                            <PrvcOfBirth>Max35Text</PrvcOfBirth><!--[0..1] Max35Text string  1..35  -->
                                            <CityOfBirth>Max35Text</CityOfBirth><!--[1..1] Max35Text string  1..35  -->
                                            <CtryOfBirth>AZ</CtryOfBirth><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                        </DtAndPlcOfBirth>
                                        <OthrId><!--[1..1] GenericIdentification4   -->
                                            <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                            <IdTp>Max35Text</IdTp><!--[1..1] Max35Text string  1..35  -->
                                        </OthrId>
                                      </__unresolvedChoice__>
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrvtId>
                                </__unresolvedChoice__>
                            </Id>
                            <CtryOfRes>AZ</CtryOfRes><!--[0..1] CountryCode string  /[A-Z]{2,2}/  -->
                        </Cdtr>
                        <CdtrAcct><!--[0..1] CashAccount7   -->
                            <Id><!--[1..1] AccountIdentification3Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <IBAN>DE28500400000123456589</IBAN><!--[1..1] IBANIdentifier string  /[a-zA-Z]{2,2}[0-9]{2,2}[a-zA-Z0-9]{1,30}/  -->
                                  <BBAN>azAZ09</BBAN><!--[1..1] BBANIdentifier string  /[a-zA-Z0-9]{1,30}/  -->
                                  <UPIC>09090909</UPIC><!--[1..1] UPICIdentifier string  /[0-9]{8,17}/  -->
                                  <PrtryAcct><!--[1..1] SimpleIdentificationInformation2   -->
                                      <Id>Max34Text</Id><!--[1..1] Max34Text string  1..34  -->
                                  </PrtryAcct>
                                </__unresolvedChoice__>
                            </Id>
                            <Tp><!--[0..1] CashAccountType2   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <Cd>CACC</Cd><!--[1..1] CashAccountType4Code string  "CACC"|"CASH"|"CHAR"|"CISH"|"COMM"|"LOAN"|"MGLD"|"MOMA"|"NREX"|"ODFT"|"ONDP"|"SACC"|"SLRY"|"SVGS"|"TAXE"|"TRAS" -->
                                  <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                </__unresolvedChoice__>
                            </Tp>
                            <Ccy>EUR</Ccy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                        </CdtrAcct>
                        <UltmtCdtr><!--[0..1] PartyIdentification8   -->
                            <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                            <PstlAdr><!--[0..1] PostalAddress1   -->
                                <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                            </PstlAdr>
                            <Id><!--[0..1] Party2Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <OrgId><!--[1..1] OrganisationIdentification2   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <IBEI>AZBDFHJNP0</IBEI><!--[0..1] IBEIIdentifier string  /[A-Z]{2,2}[B-DF-HJ-NP-TV-XZ0-9]{7,7}[0-9]{1,1}/  -->
                                      <BEI>BEIADEFF</BEI><!--[0..1] BEIIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <EANGLN>0909090909090</EANGLN><!--[0..1] EANGLNIdentifier string  /[0-9]{13,13}/  -->
                                      <USCHU>CH012345</USCHU><!--[0..1] CHIPSUniversalIdentifier string  /CH[0-9]{6,6}/  -->
                                      <DUNS>090909090</DUNS><!--[0..1] DunsIdentifier string  /[0-9]{9,9}/  -->
                                      <BkPtyId>Max35Text</BkPtyId><!--[0..1] Max35Text string  1..35  -->
                                      <TaxIdNb>Max35Text</TaxIdNb><!--[0..1] Max35Text string  1..35  -->
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </OrgId>
                                  <PrvtId><!--[1..4] PersonIdentification3   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <DrvrsLicNb>Max35Text</DrvrsLicNb><!--[1..1] Max35Text string  1..35  -->
                                        <CstmrNb>Max35Text</CstmrNb><!--[1..1] Max35Text string  1..35  -->
                                        <SclSctyNb>Max35Text</SclSctyNb><!--[1..1] Max35Text string  1..35  -->
                                        <AlnRegnNb>Max35Text</AlnRegnNb><!--[1..1] Max35Text string  1..35  -->
                                        <PsptNb>Max35Text</PsptNb><!--[1..1] Max35Text string  1..35  -->
                                        <TaxIdNb>Max35Text</TaxIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <IdntyCardNb>Max35Text</IdntyCardNb><!--[1..1] Max35Text string  1..35  -->
                                        <MplyrIdNb>Max35Text</MplyrIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <DtAndPlcOfBirth><!--[1..1] DateAndPlaceOfBirth   -->
                                            <BirthDt>2007-06-29</BirthDt><!--[1..1] ISODate date  -->
                                            <PrvcOfBirth>Max35Text</PrvcOfBirth><!--[0..1] Max35Text string  1..35  -->
                                            <CityOfBirth>Max35Text</CityOfBirth><!--[1..1] Max35Text string  1..35  -->
                                            <CtryOfBirth>AZ</CtryOfBirth><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                        </DtAndPlcOfBirth>
                                        <OthrId><!--[1..1] GenericIdentification4   -->
                                            <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                            <IdTp>Max35Text</IdTp><!--[1..1] Max35Text string  1..35  -->
                                        </OthrId>
                                      </__unresolvedChoice__>
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrvtId>
                                </__unresolvedChoice__>
                            </Id>
                            <CtryOfRes>AZ</CtryOfRes><!--[0..1] CountryCode string  /[A-Z]{2,2}/  -->
                        </UltmtCdtr>
                        <TradgPty><!--[0..1] PartyIdentification8   -->
                            <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                            <PstlAdr><!--[0..1] PostalAddress1   -->
                                <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                            </PstlAdr>
                            <Id><!--[0..1] Party2Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <OrgId><!--[1..1] OrganisationIdentification2   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <IBEI>AZBDFHJNP0</IBEI><!--[0..1] IBEIIdentifier string  /[A-Z]{2,2}[B-DF-HJ-NP-TV-XZ0-9]{7,7}[0-9]{1,1}/  -->
                                      <BEI>BEIADEFF</BEI><!--[0..1] BEIIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <EANGLN>0909090909090</EANGLN><!--[0..1] EANGLNIdentifier string  /[0-9]{13,13}/  -->
                                      <USCHU>CH012345</USCHU><!--[0..1] CHIPSUniversalIdentifier string  /CH[0-9]{6,6}/  -->
                                      <DUNS>090909090</DUNS><!--[0..1] DunsIdentifier string  /[0-9]{9,9}/  -->
                                      <BkPtyId>Max35Text</BkPtyId><!--[0..1] Max35Text string  1..35  -->
                                      <TaxIdNb>Max35Text</TaxIdNb><!--[0..1] Max35Text string  1..35  -->
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </OrgId>
                                  <PrvtId><!--[1..4] PersonIdentification3   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <DrvrsLicNb>Max35Text</DrvrsLicNb><!--[1..1] Max35Text string  1..35  -->
                                        <CstmrNb>Max35Text</CstmrNb><!--[1..1] Max35Text string  1..35  -->
                                        <SclSctyNb>Max35Text</SclSctyNb><!--[1..1] Max35Text string  1..35  -->
                                        <AlnRegnNb>Max35Text</AlnRegnNb><!--[1..1] Max35Text string  1..35  -->
                                        <PsptNb>Max35Text</PsptNb><!--[1..1] Max35Text string  1..35  -->
                                        <TaxIdNb>Max35Text</TaxIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <IdntyCardNb>Max35Text</IdntyCardNb><!--[1..1] Max35Text string  1..35  -->
                                        <MplyrIdNb>Max35Text</MplyrIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <DtAndPlcOfBirth><!--[1..1] DateAndPlaceOfBirth   -->
                                            <BirthDt>2007-06-29</BirthDt><!--[1..1] ISODate date  -->
                                            <PrvcOfBirth>Max35Text</PrvcOfBirth><!--[0..1] Max35Text string  1..35  -->
                                            <CityOfBirth>Max35Text</CityOfBirth><!--[1..1] Max35Text string  1..35  -->
                                            <CtryOfBirth>AZ</CtryOfBirth><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                        </DtAndPlcOfBirth>
                                        <OthrId><!--[1..1] GenericIdentification4   -->
                                            <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                            <IdTp>Max35Text</IdTp><!--[1..1] Max35Text string  1..35  -->
                                        </OthrId>
                                      </__unresolvedChoice__>
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrvtId>
                                </__unresolvedChoice__>
                            </Id>
                            <CtryOfRes>AZ</CtryOfRes><!--[0..1] CountryCode string  /[A-Z]{2,2}/  -->
                        </TradgPty>
                        <Prtry><!--[0..n] ProprietaryParty1   -->
                            <Tp>Max35Text</Tp><!--[1..1] Max35Text string  1..35  -->
                            <Pty><!--[1..1] PartyIdentification8   -->
                                <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                <PstlAdr><!--[0..1] PostalAddress1   -->
                                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </PstlAdr>
                                <Id><!--[0..1] Party2Choice   -->
                                    <__unresolvedChoice__><!--[1..1]    -->
                                      <OrgId><!--[1..1] OrganisationIdentification2   -->
                                          <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                          <IBEI>AZBDFHJNP0</IBEI><!--[0..1] IBEIIdentifier string  /[A-Z]{2,2}[B-DF-HJ-NP-TV-XZ0-9]{7,7}[0-9]{1,1}/  -->
                                          <BEI>BEIADEFF</BEI><!--[0..1] BEIIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                          <EANGLN>0909090909090</EANGLN><!--[0..1] EANGLNIdentifier string  /[0-9]{13,13}/  -->
                                          <USCHU>CH012345</USCHU><!--[0..1] CHIPSUniversalIdentifier string  /CH[0-9]{6,6}/  -->
                                          <DUNS>090909090</DUNS><!--[0..1] DunsIdentifier string  /[0-9]{9,9}/  -->
                                          <BkPtyId>Max35Text</BkPtyId><!--[0..1] Max35Text string  1..35  -->
                                          <TaxIdNb>Max35Text</TaxIdNb><!--[0..1] Max35Text string  1..35  -->
                                          <PrtryId><!--[0..1] GenericIdentification3   -->
                                              <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                              <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                          </PrtryId>
                                      </OrgId>
                                      <PrvtId><!--[1..4] PersonIdentification3   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <DrvrsLicNb>Max35Text</DrvrsLicNb><!--[1..1] Max35Text string  1..35  -->
                                            <CstmrNb>Max35Text</CstmrNb><!--[1..1] Max35Text string  1..35  -->
                                            <SclSctyNb>Max35Text</SclSctyNb><!--[1..1] Max35Text string  1..35  -->
                                            <AlnRegnNb>Max35Text</AlnRegnNb><!--[1..1] Max35Text string  1..35  -->
                                            <PsptNb>Max35Text</PsptNb><!--[1..1] Max35Text string  1..35  -->
                                            <TaxIdNb>Max35Text</TaxIdNb><!--[1..1] Max35Text string  1..35  -->
                                            <IdntyCardNb>Max35Text</IdntyCardNb><!--[1..1] Max35Text string  1..35  -->
                                            <MplyrIdNb>Max35Text</MplyrIdNb><!--[1..1] Max35Text string  1..35  -->
                                            <DtAndPlcOfBirth><!--[1..1] DateAndPlaceOfBirth   -->
                                                <BirthDt>2007-06-29</BirthDt><!--[1..1] ISODate date  -->
                                                <PrvcOfBirth>Max35Text</PrvcOfBirth><!--[0..1] Max35Text string  1..35  -->
                                                <CityOfBirth>Max35Text</CityOfBirth><!--[1..1] Max35Text string  1..35  -->
                                                <CtryOfBirth>AZ</CtryOfBirth><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                            </DtAndPlcOfBirth>
                                            <OthrId><!--[1..1] GenericIdentification4   -->
                                                <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                                <IdTp>Max35Text</IdTp><!--[1..1] Max35Text string  1..35  -->
                                            </OthrId>
                                          </__unresolvedChoice__>
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrvtId>
                                    </__unresolvedChoice__>
                                </Id>
                                <CtryOfRes>AZ</CtryOfRes><!--[0..1] CountryCode string  /[A-Z]{2,2}/  -->
                            </Pty>
                        </Prtry>
                    </RltdPties>
                    <RltdAgts><!--[0..1] TransactionAgents1   -->
                        <DbtrAgt><!--[0..1] BranchAndFinancialInstitutionIdentification3   -->
                            <FinInstnId><!--[1..1] FinancialInstitutionIdentification5Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <BIC>COBADEFF</BIC><!--[1..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                  <ClrSysMmbId><!--[1..1] ClearingSystemMemberIdentification3Choice   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                        <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                      </__unresolvedChoice__>
                                  </ClrSysMmbId>
                                  <NmAndAdr><!--[1..1] NameAndAddress7   -->
                                      <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[1..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                  </NmAndAdr>
                                  <PrtryId><!--[1..1] GenericIdentification3   -->
                                      <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrtryId>
                                  <CmbndId><!--[1..1] FinancialInstitutionIdentification3   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <ClrSysMmbId><!--[0..1] ClearingSystemMemberIdentification3Choice   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                            <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                          </__unresolvedChoice__>
                                      </ClrSysMmbId>
                                      <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[0..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </CmbndId>
                                </__unresolvedChoice__>
                            </FinInstnId>
                            <BrnchId><!--[0..1] BranchData   -->
                                <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                                <Nm>Max35Text</Nm><!--[0..1] Max35Text string  1..35  -->
                                <PstlAdr><!--[0..1] PostalAddress1   -->
                                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </PstlAdr>
                            </BrnchId>
                        </DbtrAgt>
                        <CdtrAgt><!--[0..1] BranchAndFinancialInstitutionIdentification3   -->
                            <FinInstnId><!--[1..1] FinancialInstitutionIdentification5Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <BIC>COBADEFF</BIC><!--[1..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                  <ClrSysMmbId><!--[1..1] ClearingSystemMemberIdentification3Choice   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                        <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                      </__unresolvedChoice__>
                                  </ClrSysMmbId>
                                  <NmAndAdr><!--[1..1] NameAndAddress7   -->
                                      <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[1..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                  </NmAndAdr>
                                  <PrtryId><!--[1..1] GenericIdentification3   -->
                                      <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrtryId>
                                  <CmbndId><!--[1..1] FinancialInstitutionIdentification3   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <ClrSysMmbId><!--[0..1] ClearingSystemMemberIdentification3Choice   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                            <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                          </__unresolvedChoice__>
                                      </ClrSysMmbId>
                                      <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[0..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </CmbndId>
                                </__unresolvedChoice__>
                            </FinInstnId>
                            <BrnchId><!--[0..1] BranchData   -->
                                <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                                <Nm>Max35Text</Nm><!--[0..1] Max35Text string  1..35  -->
                                <PstlAdr><!--[0..1] PostalAddress1   -->
                                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </PstlAdr>
                            </BrnchId>
                        </CdtrAgt>
                        <IntrmyAgt1><!--[0..1] BranchAndFinancialInstitutionIdentification3   -->
                            <FinInstnId><!--[1..1] FinancialInstitutionIdentification5Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <BIC>COBADEFF</BIC><!--[1..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                  <ClrSysMmbId><!--[1..1] ClearingSystemMemberIdentification3Choice   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                        <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                      </__unresolvedChoice__>
                                  </ClrSysMmbId>
                                  <NmAndAdr><!--[1..1] NameAndAddress7   -->
                                      <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[1..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                  </NmAndAdr>
                                  <PrtryId><!--[1..1] GenericIdentification3   -->
                                      <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrtryId>
                                  <CmbndId><!--[1..1] FinancialInstitutionIdentification3   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <ClrSysMmbId><!--[0..1] ClearingSystemMemberIdentification3Choice   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                            <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                          </__unresolvedChoice__>
                                      </ClrSysMmbId>
                                      <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[0..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </CmbndId>
                                </__unresolvedChoice__>
                            </FinInstnId>
                            <BrnchId><!--[0..1] BranchData   -->
                                <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                                <Nm>Max35Text</Nm><!--[0..1] Max35Text string  1..35  -->
                                <PstlAdr><!--[0..1] PostalAddress1   -->
                                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </PstlAdr>
                            </BrnchId>
                        </IntrmyAgt1>
                        <IntrmyAgt2><!--[0..1] BranchAndFinancialInstitutionIdentification3   -->
                            <FinInstnId><!--[1..1] FinancialInstitutionIdentification5Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <BIC>COBADEFF</BIC><!--[1..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                  <ClrSysMmbId><!--[1..1] ClearingSystemMemberIdentification3Choice   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                        <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                      </__unresolvedChoice__>
                                  </ClrSysMmbId>
                                  <NmAndAdr><!--[1..1] NameAndAddress7   -->
                                      <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[1..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                  </NmAndAdr>
                                  <PrtryId><!--[1..1] GenericIdentification3   -->
                                      <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrtryId>
                                  <CmbndId><!--[1..1] FinancialInstitutionIdentification3   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <ClrSysMmbId><!--[0..1] ClearingSystemMemberIdentification3Choice   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                            <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                          </__unresolvedChoice__>
                                      </ClrSysMmbId>
                                      <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[0..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </CmbndId>
                                </__unresolvedChoice__>
                            </FinInstnId>
                            <BrnchId><!--[0..1] BranchData   -->
                                <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                                <Nm>Max35Text</Nm><!--[0..1] Max35Text string  1..35  -->
                                <PstlAdr><!--[0..1] PostalAddress1   -->
                                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </PstlAdr>
                            </BrnchId>
                        </IntrmyAgt2>
                        <IntrmyAgt3><!--[0..1] BranchAndFinancialInstitutionIdentification3   -->
                            <FinInstnId><!--[1..1] FinancialInstitutionIdentification5Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <BIC>COBADEFF</BIC><!--[1..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                  <ClrSysMmbId><!--[1..1] ClearingSystemMemberIdentification3Choice   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                        <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                      </__unresolvedChoice__>
                                  </ClrSysMmbId>
                                  <NmAndAdr><!--[1..1] NameAndAddress7   -->
                                      <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[1..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                  </NmAndAdr>
                                  <PrtryId><!--[1..1] GenericIdentification3   -->
                                      <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrtryId>
                                  <CmbndId><!--[1..1] FinancialInstitutionIdentification3   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <ClrSysMmbId><!--[0..1] ClearingSystemMemberIdentification3Choice   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                            <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                          </__unresolvedChoice__>
                                      </ClrSysMmbId>
                                      <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[0..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </CmbndId>
                                </__unresolvedChoice__>
                            </FinInstnId>
                            <BrnchId><!--[0..1] BranchData   -->
                                <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                                <Nm>Max35Text</Nm><!--[0..1] Max35Text string  1..35  -->
                                <PstlAdr><!--[0..1] PostalAddress1   -->
                                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </PstlAdr>
                            </BrnchId>
                        </IntrmyAgt3>
                        <RcvgAgt><!--[0..1] BranchAndFinancialInstitutionIdentification3   -->
                            <FinInstnId><!--[1..1] FinancialInstitutionIdentification5Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <BIC>COBADEFF</BIC><!--[1..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                  <ClrSysMmbId><!--[1..1] ClearingSystemMemberIdentification3Choice   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                        <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                      </__unresolvedChoice__>
                                  </ClrSysMmbId>
                                  <NmAndAdr><!--[1..1] NameAndAddress7   -->
                                      <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[1..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                  </NmAndAdr>
                                  <PrtryId><!--[1..1] GenericIdentification3   -->
                                      <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrtryId>
                                  <CmbndId><!--[1..1] FinancialInstitutionIdentification3   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <ClrSysMmbId><!--[0..1] ClearingSystemMemberIdentification3Choice   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                            <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                          </__unresolvedChoice__>
                                      </ClrSysMmbId>
                                      <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[0..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </CmbndId>
                                </__unresolvedChoice__>
                            </FinInstnId>
                            <BrnchId><!--[0..1] BranchData   -->
                                <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                                <Nm>Max35Text</Nm><!--[0..1] Max35Text string  1..35  -->
                                <PstlAdr><!--[0..1] PostalAddress1   -->
                                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </PstlAdr>
                            </BrnchId>
                        </RcvgAgt>
                        <DlvrgAgt><!--[0..1] BranchAndFinancialInstitutionIdentification3   -->
                            <FinInstnId><!--[1..1] FinancialInstitutionIdentification5Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <BIC>COBADEFF</BIC><!--[1..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                  <ClrSysMmbId><!--[1..1] ClearingSystemMemberIdentification3Choice   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                        <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                      </__unresolvedChoice__>
                                  </ClrSysMmbId>
                                  <NmAndAdr><!--[1..1] NameAndAddress7   -->
                                      <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[1..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                  </NmAndAdr>
                                  <PrtryId><!--[1..1] GenericIdentification3   -->
                                      <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrtryId>
                                  <CmbndId><!--[1..1] FinancialInstitutionIdentification3   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <ClrSysMmbId><!--[0..1] ClearingSystemMemberIdentification3Choice   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                            <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                          </__unresolvedChoice__>
                                      </ClrSysMmbId>
                                      <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[0..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </CmbndId>
                                </__unresolvedChoice__>
                            </FinInstnId>
                            <BrnchId><!--[0..1] BranchData   -->
                                <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                                <Nm>Max35Text</Nm><!--[0..1] Max35Text string  1..35  -->
                                <PstlAdr><!--[0..1] PostalAddress1   -->
                                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </PstlAdr>
                            </BrnchId>
                        </DlvrgAgt>
                        <IssgAgt><!--[0..1] BranchAndFinancialInstitutionIdentification3   -->
                            <FinInstnId><!--[1..1] FinancialInstitutionIdentification5Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <BIC>COBADEFF</BIC><!--[1..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                  <ClrSysMmbId><!--[1..1] ClearingSystemMemberIdentification3Choice   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                        <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                      </__unresolvedChoice__>
                                  </ClrSysMmbId>
                                  <NmAndAdr><!--[1..1] NameAndAddress7   -->
                                      <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[1..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                  </NmAndAdr>
                                  <PrtryId><!--[1..1] GenericIdentification3   -->
                                      <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrtryId>
                                  <CmbndId><!--[1..1] FinancialInstitutionIdentification3   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <ClrSysMmbId><!--[0..1] ClearingSystemMemberIdentification3Choice   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                            <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                          </__unresolvedChoice__>
                                      </ClrSysMmbId>
                                      <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[0..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </CmbndId>
                                </__unresolvedChoice__>
                            </FinInstnId>
                            <BrnchId><!--[0..1] BranchData   -->
                                <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                                <Nm>Max35Text</Nm><!--[0..1] Max35Text string  1..35  -->
                                <PstlAdr><!--[0..1] PostalAddress1   -->
                                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </PstlAdr>
                            </BrnchId>
                        </IssgAgt>
                        <SttlmPlc><!--[0..1] BranchAndFinancialInstitutionIdentification3   -->
                            <FinInstnId><!--[1..1] FinancialInstitutionIdentification5Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <BIC>COBADEFF</BIC><!--[1..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                  <ClrSysMmbId><!--[1..1] ClearingSystemMemberIdentification3Choice   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                        <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                      </__unresolvedChoice__>
                                  </ClrSysMmbId>
                                  <NmAndAdr><!--[1..1] NameAndAddress7   -->
                                      <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[1..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                  </NmAndAdr>
                                  <PrtryId><!--[1..1] GenericIdentification3   -->
                                      <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrtryId>
                                  <CmbndId><!--[1..1] FinancialInstitutionIdentification3   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <ClrSysMmbId><!--[0..1] ClearingSystemMemberIdentification3Choice   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                            <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                          </__unresolvedChoice__>
                                      </ClrSysMmbId>
                                      <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                      <PstlAdr><!--[0..1] PostalAddress1   -->
                                          <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                          <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                          <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                          <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                          <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                          <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                          <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                          <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                      </PstlAdr>
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </CmbndId>
                                </__unresolvedChoice__>
                            </FinInstnId>
                            <BrnchId><!--[0..1] BranchData   -->
                                <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                                <Nm>Max35Text</Nm><!--[0..1] Max35Text string  1..35  -->
                                <PstlAdr><!--[0..1] PostalAddress1   -->
                                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </PstlAdr>
                            </BrnchId>
                        </SttlmPlc>
                        <Prtry><!--[0..n] ProprietaryAgent1   -->
                            <Tp>Max35Text</Tp><!--[1..1] Max35Text string  1..35  -->
                            <Agt><!--[1..1] BranchAndFinancialInstitutionIdentification3   -->
                                <FinInstnId><!--[1..1] FinancialInstitutionIdentification5Choice   -->
                                    <__unresolvedChoice__><!--[1..1]    -->
                                      <BIC>COBADEFF</BIC><!--[1..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <ClrSysMmbId><!--[1..1] ClearingSystemMemberIdentification3Choice   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                            <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                          </__unresolvedChoice__>
                                      </ClrSysMmbId>
                                      <NmAndAdr><!--[1..1] NameAndAddress7   -->
                                          <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                                          <PstlAdr><!--[1..1] PostalAddress1   -->
                                              <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                              <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                              <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                              <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                              <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                              <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                              <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                              <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                          </PstlAdr>
                                      </NmAndAdr>
                                      <PrtryId><!--[1..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                      <CmbndId><!--[1..1] FinancialInstitutionIdentification3   -->
                                          <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                          <ClrSysMmbId><!--[0..1] ClearingSystemMemberIdentification3Choice   -->
                                              <__unresolvedChoice__><!--[1..1]    -->
                                                <Id>ExternalClearingSystemMemberCode</Id><!--[1..1] ExternalClearingSystemMemberCode string  1..35  -->
                                                <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                              </__unresolvedChoice__>
                                          </ClrSysMmbId>
                                          <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                          <PstlAdr><!--[0..1] PostalAddress1   -->
                                              <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                              <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                              <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                              <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                              <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                              <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                              <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                              <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                          </PstlAdr>
                                          <PrtryId><!--[0..1] GenericIdentification3   -->
                                              <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                              <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                          </PrtryId>
                                      </CmbndId>
                                    </__unresolvedChoice__>
                                </FinInstnId>
                                <BrnchId><!--[0..1] BranchData   -->
                                    <Id>Max35Text</Id><!--[0..1] Max35Text string  1..35  -->
                                    <Nm>Max35Text</Nm><!--[0..1] Max35Text string  1..35  -->
                                    <PstlAdr><!--[0..1] PostalAddress1   -->
                                        <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                        <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                        <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                        <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                        <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                        <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                        <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                        <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                    </PstlAdr>
                                </BrnchId>
                            </Agt>
                        </Prtry>
                    </RltdAgts>
                    <Purp><!--[0..1] Purpose1Choice   -->
                        <__unresolvedChoice__><!--[1..1]    -->
                          <Cd>ExternalPurposeCode</Cd><!--[1..1] ExternalPurposeCode string  1..35  -->
                          <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                        </__unresolvedChoice__>
                    </Purp>
                    <RltdRmtInf><!--[0..10] RemittanceLocation1   -->
                        <RmtId>Max35Text</RmtId><!--[0..1] Max35Text string  1..35  -->
                        <RmtLctnMtd>EDIC</RmtLctnMtd><!--[0..1] RemittanceLocationMethod1Code string  "EDIC"|"EMAL"|"FAXI"|"POST"|"URID" -->
                        <RmtLctnElctrncAdr>Max256Text</RmtLctnElctrncAdr><!--[0..1] Max256Text string  1..256  -->
                        <RmtLctnPstlAdr><!--[0..1] NameAndAddress3   -->
                            <Nm>Max70Text</Nm><!--[1..1] Max70Text string  1..70  -->
                            <Adr><!--[1..1] PostalAddress1   -->
                                <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                            </Adr>
                        </RmtLctnPstlAdr>
                    </RltdRmtInf>
                    <RmtInf><!--[0..1] RemittanceInformation1   -->
                        <Ustrd>Max140Text</Ustrd><!--[0..n] Max140Text string  1..140  -->
                        <Strd><!--[0..n] StructuredRemittanceInformation6   -->
                            <RfrdDocInf><!--[0..1] ReferredDocumentInformation1   -->
                                <RfrdDocTp><!--[0..1] ReferredDocumentType1   -->
                                    <__unresolvedChoice__><!--[1..1]    -->
                                      <Cd>CINV</Cd><!--[1..1] DocumentType2Code string  "CINV"|"CMCN"|"CNFA"|"CREN"|"DEBN"|"DISP"|"DNFA"|"HIRI"|"MSIN"|"SBIN"|"SOAC" -->
                                      <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                    </__unresolvedChoice__>
                                    <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                </RfrdDocTp>
                                <RfrdDocNb>Max35Text</RfrdDocNb><!--[0..1] Max35Text string  1..35  -->
                            </RfrdDocInf>
                            <RfrdDocRltdDt>2007-06-29</RfrdDocRltdDt><!--[0..1] ISODate date  -->
                            <RfrdDocAmt><!--[0..n] ReferredDocumentAmount1Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <DuePyblAmt Ccy="EUR">1</DuePyblAmt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                        <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                  <DscntApldAmt Ccy="EUR">1</DscntApldAmt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                        <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                  <RmtdAmt Ccy="EUR">1</RmtdAmt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                        <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                  <CdtNoteAmt Ccy="EUR">1</CdtNoteAmt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                        <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                  <TaxAmt Ccy="EUR">1</TaxAmt><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                        <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                </__unresolvedChoice__>
                            </RfrdDocAmt>
                            <CdtrRefInf><!--[0..1] CreditorReferenceInformation1   -->
                                <CdtrRefTp><!--[0..1] CreditorReferenceType1   -->
                                    <__unresolvedChoice__><!--[1..1]    -->
                                      <Cd>DISP</Cd><!--[1..1] DocumentType3Code string  "DISP"|"FXDR"|"PUOR"|"RADM"|"RPIN"|"SCOR" -->
                                      <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                                    </__unresolvedChoice__>
                                    <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                </CdtrRefTp>
                                <CdtrRef>Max35Text</CdtrRef><!--[0..1] Max35Text string  1..35  -->
                            </CdtrRefInf>
                            <Invcr><!--[0..1] PartyIdentification8   -->
                                <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                <PstlAdr><!--[0..1] PostalAddress1   -->
                                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </PstlAdr>
                                <Id><!--[0..1] Party2Choice   -->
                                    <__unresolvedChoice__><!--[1..1]    -->
                                      <OrgId><!--[1..1] OrganisationIdentification2   -->
                                          <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                          <IBEI>AZBDFHJNP0</IBEI><!--[0..1] IBEIIdentifier string  /[A-Z]{2,2}[B-DF-HJ-NP-TV-XZ0-9]{7,7}[0-9]{1,1}/  -->
                                          <BEI>BEIADEFF</BEI><!--[0..1] BEIIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                          <EANGLN>0909090909090</EANGLN><!--[0..1] EANGLNIdentifier string  /[0-9]{13,13}/  -->
                                          <USCHU>CH012345</USCHU><!--[0..1] CHIPSUniversalIdentifier string  /CH[0-9]{6,6}/  -->
                                          <DUNS>090909090</DUNS><!--[0..1] DunsIdentifier string  /[0-9]{9,9}/  -->
                                          <BkPtyId>Max35Text</BkPtyId><!--[0..1] Max35Text string  1..35  -->
                                          <TaxIdNb>Max35Text</TaxIdNb><!--[0..1] Max35Text string  1..35  -->
                                          <PrtryId><!--[0..1] GenericIdentification3   -->
                                              <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                              <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                          </PrtryId>
                                      </OrgId>
                                      <PrvtId><!--[1..4] PersonIdentification3   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <DrvrsLicNb>Max35Text</DrvrsLicNb><!--[1..1] Max35Text string  1..35  -->
                                            <CstmrNb>Max35Text</CstmrNb><!--[1..1] Max35Text string  1..35  -->
                                            <SclSctyNb>Max35Text</SclSctyNb><!--[1..1] Max35Text string  1..35  -->
                                            <AlnRegnNb>Max35Text</AlnRegnNb><!--[1..1] Max35Text string  1..35  -->
                                            <PsptNb>Max35Text</PsptNb><!--[1..1] Max35Text string  1..35  -->
                                            <TaxIdNb>Max35Text</TaxIdNb><!--[1..1] Max35Text string  1..35  -->
                                            <IdntyCardNb>Max35Text</IdntyCardNb><!--[1..1] Max35Text string  1..35  -->
                                            <MplyrIdNb>Max35Text</MplyrIdNb><!--[1..1] Max35Text string  1..35  -->
                                            <DtAndPlcOfBirth><!--[1..1] DateAndPlaceOfBirth   -->
                                                <BirthDt>2007-06-29</BirthDt><!--[1..1] ISODate date  -->
                                                <PrvcOfBirth>Max35Text</PrvcOfBirth><!--[0..1] Max35Text string  1..35  -->
                                                <CityOfBirth>Max35Text</CityOfBirth><!--[1..1] Max35Text string  1..35  -->
                                                <CtryOfBirth>AZ</CtryOfBirth><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                            </DtAndPlcOfBirth>
                                            <OthrId><!--[1..1] GenericIdentification4   -->
                                                <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                                <IdTp>Max35Text</IdTp><!--[1..1] Max35Text string  1..35  -->
                                            </OthrId>
                                          </__unresolvedChoice__>
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrvtId>
                                    </__unresolvedChoice__>
                                </Id>
                                <CtryOfRes>AZ</CtryOfRes><!--[0..1] CountryCode string  /[A-Z]{2,2}/  -->
                            </Invcr>
                            <Invcee><!--[0..1] PartyIdentification8   -->
                                <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                                <PstlAdr><!--[0..1] PostalAddress1   -->
                                    <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                    <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                    <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                    <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                    <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                    <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                    <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                    <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                </PstlAdr>
                                <Id><!--[0..1] Party2Choice   -->
                                    <__unresolvedChoice__><!--[1..1]    -->
                                      <OrgId><!--[1..1] OrganisationIdentification2   -->
                                          <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                          <IBEI>AZBDFHJNP0</IBEI><!--[0..1] IBEIIdentifier string  /[A-Z]{2,2}[B-DF-HJ-NP-TV-XZ0-9]{7,7}[0-9]{1,1}/  -->
                                          <BEI>BEIADEFF</BEI><!--[0..1] BEIIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                          <EANGLN>0909090909090</EANGLN><!--[0..1] EANGLNIdentifier string  /[0-9]{13,13}/  -->
                                          <USCHU>CH012345</USCHU><!--[0..1] CHIPSUniversalIdentifier string  /CH[0-9]{6,6}/  -->
                                          <DUNS>090909090</DUNS><!--[0..1] DunsIdentifier string  /[0-9]{9,9}/  -->
                                          <BkPtyId>Max35Text</BkPtyId><!--[0..1] Max35Text string  1..35  -->
                                          <TaxIdNb>Max35Text</TaxIdNb><!--[0..1] Max35Text string  1..35  -->
                                          <PrtryId><!--[0..1] GenericIdentification3   -->
                                              <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                              <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                          </PrtryId>
                                      </OrgId>
                                      <PrvtId><!--[1..4] PersonIdentification3   -->
                                          <__unresolvedChoice__><!--[1..1]    -->
                                            <DrvrsLicNb>Max35Text</DrvrsLicNb><!--[1..1] Max35Text string  1..35  -->
                                            <CstmrNb>Max35Text</CstmrNb><!--[1..1] Max35Text string  1..35  -->
                                            <SclSctyNb>Max35Text</SclSctyNb><!--[1..1] Max35Text string  1..35  -->
                                            <AlnRegnNb>Max35Text</AlnRegnNb><!--[1..1] Max35Text string  1..35  -->
                                            <PsptNb>Max35Text</PsptNb><!--[1..1] Max35Text string  1..35  -->
                                            <TaxIdNb>Max35Text</TaxIdNb><!--[1..1] Max35Text string  1..35  -->
                                            <IdntyCardNb>Max35Text</IdntyCardNb><!--[1..1] Max35Text string  1..35  -->
                                            <MplyrIdNb>Max35Text</MplyrIdNb><!--[1..1] Max35Text string  1..35  -->
                                            <DtAndPlcOfBirth><!--[1..1] DateAndPlaceOfBirth   -->
                                                <BirthDt>2007-06-29</BirthDt><!--[1..1] ISODate date  -->
                                                <PrvcOfBirth>Max35Text</PrvcOfBirth><!--[0..1] Max35Text string  1..35  -->
                                                <CityOfBirth>Max35Text</CityOfBirth><!--[1..1] Max35Text string  1..35  -->
                                                <CtryOfBirth>AZ</CtryOfBirth><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                            </DtAndPlcOfBirth>
                                            <OthrId><!--[1..1] GenericIdentification4   -->
                                                <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                                <IdTp>Max35Text</IdTp><!--[1..1] Max35Text string  1..35  -->
                                            </OthrId>
                                          </__unresolvedChoice__>
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrvtId>
                                    </__unresolvedChoice__>
                                </Id>
                                <CtryOfRes>AZ</CtryOfRes><!--[0..1] CountryCode string  /[A-Z]{2,2}/  -->
                            </Invcee>
                            <AddtlRmtInf>Max140Text</AddtlRmtInf><!--[0..1] Max140Text string  1..140  -->
                        </Strd>
                    </RmtInf>
                    <RltdDts><!--[0..1] TransactionDates1   -->
                        <AccptncDtTm>2007-06-29T04:30:00Z</AccptncDtTm><!--[0..1] ISODateTime dateTime  -->
                        <TradDt>2007-06-29</TradDt><!--[0..1] ISODate date  -->
                        <IntrBkSttlmDt>2007-06-29</IntrBkSttlmDt><!--[0..1] ISODate date  -->
                        <StartDt>2007-06-29</StartDt><!--[0..1] ISODate date  -->
                        <EndDt>2007-06-29</EndDt><!--[0..1] ISODate date  -->
                        <TxDtTm>2007-06-29T04:30:00Z</TxDtTm><!--[0..1] ISODateTime dateTime  -->
                        <Prtry><!--[0..n] ProprietaryDate1   -->
                            <Tp>Max35Text</Tp><!--[1..1] Max35Text string  1..35  -->
                            <__unresolvedChoice__><!--[1..1]    -->
                              <Dt>2007-06-29</Dt><!--[1..1] ISODate date  -->
                              <DtTm>2007-06-29T04:30:00Z</DtTm><!--[1..1] ISODateTime dateTime  -->
                            </__unresolvedChoice__>
                        </Prtry>
                    </RltdDts>
                    <RltdPric><!--[0..1] TransactionPrice1Choice   -->
                        <__unresolvedChoice__><!--[1..1]    -->
                          <DealPric Ccy="EUR">1</DealPric><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                          <Prtry><!--[1..n] ProprietaryPrice1   -->
                              <Tp>Max35Text</Tp><!--[1..1] Max35Text string  1..35  -->
                              <Pric Ccy="EUR">1</Pric><!--[1..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                    <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                          </Prtry>
                        </__unresolvedChoice__>
                    </RltdPric>
                    <RltdQties><!--[0..n] TransactionQuantities1Choice   -->
                        <__unresolvedChoice__><!--[1..1]    -->
                          <Qty><!--[1..1] FinancialInstrumentQuantityChoice   -->
                              <__unresolvedChoice__><!--[1..1]    -->
                                <Unit>1</Unit><!--[1..1] DecimalNumber decimal  L18.17  -->
                                <FaceAmt>1</FaceAmt><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                                <AmtsdVal>1</AmtsdVal><!--[1..1] ImpliedCurrencyAndAmount decimal  >=0 L18.5  -->
                              </__unresolvedChoice__>
                          </Qty>
                          <Prtry><!--[1..1] ProprietaryQuantity1   -->
                              <Tp>Max35Text</Tp><!--[1..1] Max35Text string  1..35  -->
                              <Qty>Max35Text</Qty><!--[1..1] Max35Text string  1..35  -->
                          </Prtry>
                        </__unresolvedChoice__>
                    </RltdQties>
                    <FinInstrmId><!--[0..1] SecurityIdentification4Choice   -->
                        <__unresolvedChoice__><!--[1..1]    -->
                          <ISIN>AZ09AZ09AZ09</ISIN><!--[1..1] ISINIdentifier string  /[A-Z0-9]{12,12}/  -->
                          <Prtry><!--[1..1] AlternateSecurityIdentification2   -->
                              <Tp>Max35Text</Tp><!--[1..1] Max35Text string  1..35  -->
                              <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                          </Prtry>
                        </__unresolvedChoice__>
                    </FinInstrmId>
                    <Tax><!--[0..1] TaxInformation2   -->
                        <CdtrTaxId>Max35Text</CdtrTaxId><!--[0..1] Max35Text string  1..35  -->
                        <CdtrTaxTp>Max35Text</CdtrTaxTp><!--[0..1] Max35Text string  1..35  -->
                        <DbtrTaxId>Max35Text</DbtrTaxId><!--[0..1] Max35Text string  1..35  -->
                        <TaxRefNb>Max140Text</TaxRefNb><!--[0..1] Max140Text string  1..140  -->
                        <TtlTaxblBaseAmt Ccy="EUR">1</TtlTaxblBaseAmt><!--[0..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                              <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        <TtlTaxAmt Ccy="EUR">1</TtlTaxAmt><!--[0..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                              <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        <TaxDt>2007-06-29</TaxDt><!--[0..1] ISODate date  -->
                        <TaxTpInf><!--[0..n] TaxDetails   -->
                            <CertId>Max35Text</CertId><!--[0..1] Max35Text string  1..35  -->
                            <TaxTp><!--[0..1] TaxType   -->
                                <CtgyDesc>Max35Text</CtgyDesc><!--[0..1] Max35Text string  1..35  -->
                                <Rate>1</Rate><!--[0..1] PercentageRate decimal  L11.10  -->
                                <TaxblBaseAmt Ccy="EUR">1</TaxblBaseAmt><!--[0..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                      <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                                <Amt Ccy="EUR">1</Amt><!--[0..1] CurrencyAndAmount decimal  >=0 L18.5  -->
                                      <!--@Ccy--><!--[1..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                            </TaxTp>
                        </TaxTpInf>
                    </Tax>
                    <RtrInf><!--[0..1] ReturnReasonInformation5   -->
                        <OrgnlBkTxCd><!--[0..1] BankTransactionCodeStructure1   -->
                            <Domn><!--[0..1] BankTransactionCodeStructure2   -->
                                <Cd>Exte</Cd><!--[1..1] ExternalBankTransactionDomainCode string  1..4  -->
                                <Fmly><!--[1..1] BankTransactionCodeStructure3   -->
                                    <Cd>Exte</Cd><!--[1..1] ExternalBankTransactionFamilyCode string  1..4  -->
                                    <SubFmlyCd>Exte</SubFmlyCd><!--[1..1] ExternalBankTransactionSubFamilyCode string  1..4  -->
                                </Fmly>
                            </Domn>
                            <Prtry><!--[0..1] ProprietaryBankTransactionCodeStructure1   -->
                                <Cd>Max35Text</Cd><!--[1..1] Max35Text string  1..35  -->
                                <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                            </Prtry>
                        </OrgnlBkTxCd>
                        <RtrOrgtr><!--[0..1] PartyIdentification8   -->
                            <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                            <PstlAdr><!--[0..1] PostalAddress1   -->
                                <AdrTp>ADDR</AdrTp><!--[0..1] AddressType2Code string  "ADDR"|"BIZZ"|"DLVY"|"HOME"|"MLTO"|"PBOX" -->
                                <AdrLine>Max70Text</AdrLine><!--[0..5] Max70Text string  1..70  -->
                                <StrtNm>Max70Text</StrtNm><!--[0..1] Max70Text string  1..70  -->
                                <BldgNb>Max16Text</BldgNb><!--[0..1] Max16Text string  1..16  -->
                                <PstCd>Max16Text</PstCd><!--[0..1] Max16Text string  1..16  -->
                                <TwnNm>Max35Text</TwnNm><!--[0..1] Max35Text string  1..35  -->
                                <CtrySubDvsn>Max35Text</CtrySubDvsn><!--[0..1] Max35Text string  1..35  -->
                                <Ctry>AZ</Ctry><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                            </PstlAdr>
                            <Id><!--[0..1] Party2Choice   -->
                                <__unresolvedChoice__><!--[1..1]    -->
                                  <OrgId><!--[1..1] OrganisationIdentification2   -->
                                      <BIC>COBADEFF</BIC><!--[0..1] BICIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <IBEI>AZBDFHJNP0</IBEI><!--[0..1] IBEIIdentifier string  /[A-Z]{2,2}[B-DF-HJ-NP-TV-XZ0-9]{7,7}[0-9]{1,1}/  -->
                                      <BEI>BEIADEFF</BEI><!--[0..1] BEIIdentifier string  /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/  -->
                                      <EANGLN>0909090909090</EANGLN><!--[0..1] EANGLNIdentifier string  /[0-9]{13,13}/  -->
                                      <USCHU>CH012345</USCHU><!--[0..1] CHIPSUniversalIdentifier string  /CH[0-9]{6,6}/  -->
                                      <DUNS>090909090</DUNS><!--[0..1] DunsIdentifier string  /[0-9]{9,9}/  -->
                                      <BkPtyId>Max35Text</BkPtyId><!--[0..1] Max35Text string  1..35  -->
                                      <TaxIdNb>Max35Text</TaxIdNb><!--[0..1] Max35Text string  1..35  -->
                                      <PrtryId><!--[0..1] GenericIdentification3   -->
                                          <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                          <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                      </PrtryId>
                                  </OrgId>
                                  <PrvtId><!--[1..4] PersonIdentification3   -->
                                      <__unresolvedChoice__><!--[1..1]    -->
                                        <DrvrsLicNb>Max35Text</DrvrsLicNb><!--[1..1] Max35Text string  1..35  -->
                                        <CstmrNb>Max35Text</CstmrNb><!--[1..1] Max35Text string  1..35  -->
                                        <SclSctyNb>Max35Text</SclSctyNb><!--[1..1] Max35Text string  1..35  -->
                                        <AlnRegnNb>Max35Text</AlnRegnNb><!--[1..1] Max35Text string  1..35  -->
                                        <PsptNb>Max35Text</PsptNb><!--[1..1] Max35Text string  1..35  -->
                                        <TaxIdNb>Max35Text</TaxIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <IdntyCardNb>Max35Text</IdntyCardNb><!--[1..1] Max35Text string  1..35  -->
                                        <MplyrIdNb>Max35Text</MplyrIdNb><!--[1..1] Max35Text string  1..35  -->
                                        <DtAndPlcOfBirth><!--[1..1] DateAndPlaceOfBirth   -->
                                            <BirthDt>2007-06-29</BirthDt><!--[1..1] ISODate date  -->
                                            <PrvcOfBirth>Max35Text</PrvcOfBirth><!--[0..1] Max35Text string  1..35  -->
                                            <CityOfBirth>Max35Text</CityOfBirth><!--[1..1] Max35Text string  1..35  -->
                                            <CtryOfBirth>AZ</CtryOfBirth><!--[1..1] CountryCode string  /[A-Z]{2,2}/  -->
                                        </DtAndPlcOfBirth>
                                        <OthrId><!--[1..1] GenericIdentification4   -->
                                            <Id>Max35Text</Id><!--[1..1] Max35Text string  1..35  -->
                                            <IdTp>Max35Text</IdTp><!--[1..1] Max35Text string  1..35  -->
                                        </OthrId>
                                      </__unresolvedChoice__>
                                      <Issr>Max35Text</Issr><!--[0..1] Max35Text string  1..35  -->
                                  </PrvtId>
                                </__unresolvedChoice__>
                            </Id>
                            <CtryOfRes>AZ</CtryOfRes><!--[0..1] CountryCode string  /[A-Z]{2,2}/  -->
                        </RtrOrgtr>
                        <RtrRsn><!--[0..1] ReturnReason1Choice   -->
                            <__unresolvedChoice__><!--[1..1]    -->
                              <Cd>AC01</Cd><!--[1..1] TransactionRejectReason2Code string  "AC01"|"AC04"|"AC06"|"AG01"|"AG02"|"AM01"|"AM02"|"AM03"|"AM04"|"AM05"|"AM06"|"AM07"|"AM09"|"AM10"|"BE01"|"BE04"|"BE05"|"BE06"|"BE07"|"DT01"|"ED01"|"ED03"|"ED05"|"MD01"|"MD02"|"MD03"|"MD04"|"MD06"|"MD07"|"MS02"|"MS03"|"NARR"|"RC01"|"RF01"|"TM01" -->
                              <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                            </__unresolvedChoice__>
                        </RtrRsn>
                        <AddtlRtrRsnInf>Max105Text</AddtlRtrRsnInf><!--[0..n] Max105Text string  1..105  -->
                    </RtrInf>
                    <CorpActn><!--[0..1] CorporateAction1   -->
                        <Cd>Max35Text</Cd><!--[0..1] Max35Text string  1..35  -->
                        <Nb>Max35Text</Nb><!--[0..1] Max35Text string  1..35  -->
                        <Prtry>Max35Text</Prtry><!--[0..1] Max35Text string  1..35  -->
                    </CorpActn>
                    <SfkpgAcct><!--[0..1] CashAccount7   -->
                        <Id><!--[1..1] AccountIdentification3Choice   -->
                            <__unresolvedChoice__><!--[1..1]    -->
                              <IBAN>DE28500400000123456589</IBAN><!--[1..1] IBANIdentifier string  /[a-zA-Z]{2,2}[0-9]{2,2}[a-zA-Z0-9]{1,30}/  -->
                              <BBAN>azAZ09</BBAN><!--[1..1] BBANIdentifier string  /[a-zA-Z0-9]{1,30}/  -->
                              <UPIC>09090909</UPIC><!--[1..1] UPICIdentifier string  /[0-9]{8,17}/  -->
                              <PrtryAcct><!--[1..1] SimpleIdentificationInformation2   -->
                                  <Id>Max34Text</Id><!--[1..1] Max34Text string  1..34  -->
                              </PrtryAcct>
                            </__unresolvedChoice__>
                        </Id>
                        <Tp><!--[0..1] CashAccountType2   -->
                            <__unresolvedChoice__><!--[1..1]    -->
                              <Cd>CACC</Cd><!--[1..1] CashAccountType4Code string  "CACC"|"CASH"|"CHAR"|"CISH"|"COMM"|"LOAN"|"MGLD"|"MOMA"|"NREX"|"ODFT"|"ONDP"|"SACC"|"SLRY"|"SVGS"|"TAXE"|"TRAS" -->
                              <Prtry>Max35Text</Prtry><!--[1..1] Max35Text string  1..35  -->
                            </__unresolvedChoice__>
                        </Tp>
                        <Ccy>EUR</Ccy><!--[0..1] CurrencyCode string  /[A-Z]{3,3}/  -->
                        <Nm>Max70Text</Nm><!--[0..1] Max70Text string  1..70  -->
                    </SfkpgAcct>
                    <AddtlTxInf>Max500Text</AddtlTxInf><!--[0..1] Max500Text string  1..500  -->
                </TxDtls>
                <AddtlNtryInf>Max500Text</AddtlNtryInf><!--[0..1] Max500Text string  1..500  -->
            </Ntry>
            <AddtlRptInf>Max500Text</AddtlRptInf><!--[0..1] Max500Text string  1..500  -->
        </Rpt>
    </BkToCstmrAcctRptV01>
</Document>


