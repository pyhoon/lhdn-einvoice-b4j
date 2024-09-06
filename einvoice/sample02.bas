B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=10
@EndOfDesignText@
Sub Class_Globals

End Sub

Public Sub Initialize

End Sub

Public Sub ParseJSON (Text As String)
	Dim parser As JSONParser
	parser.Initialize(Text)
	Dim jRoot As Map = parser.NextObject
	Dim s_D As String = jRoot.Get("_D")
	Dim s_A As String = jRoot.Get("_A")
	Dim s_B As String = jRoot.Get("_B")

	Log("_D: " & s_D)
	Log("_A: " & s_A)
	Log("_B: " & s_B)

	Dim Invoice As List = jRoot.Get("Invoice")
	For Each colInvoice As Map In Invoice
		Dim ID As List = colInvoice.Get("ID")
		'LogColor("[ID]", COLOR_GREEN)
		For Each colID As Map In ID
			Dim s_ As String = colID.Get("_")
			Log($"ID: ${s_}"$)
		Next
		'LogColor("[/ID]", COLOR_GREEN)
		Dim IssueDate As List = colInvoice.Get("IssueDate")
		'LogColor("[IssueDate]", COLOR_GREEN)
		For Each colIssueDate As Map In IssueDate
			Dim s_ As String = colIssueDate.Get("_")
			Log($"IssueDate: ${s_}"$)
		Next
		'LogColor("[/IssueDate]", COLOR_GREEN)
		Dim IssueTime As List = colInvoice.Get("IssueTime")
		'LogColor("[IssueTime]", COLOR_GREEN)
		For Each colIssueTime As Map In IssueTime
			Dim s_ As String = colIssueTime.Get("_")
			Log($"IssueTime: ${s_}"$)
		Next
		'LogColor("[/IssueTime]", COLOR_GREEN)
		Dim InvoiceTypeCode As List = colInvoice.Get("InvoiceTypeCode")
		For Each colInvoiceTypeCode As Map In InvoiceTypeCode
			Dim s_ As String = colInvoiceTypeCode.Get("_")
			Log($"InvoiceTypeCode: ${s_}"$)
			Dim listVersionID As String = colInvoiceTypeCode.Get("listVersionID")
			Log($"listVersionID: ${listVersionID}"$)
		Next
		Dim DocumentCurrencyCode As List = colInvoice.Get("DocumentCurrencyCode")
		For Each colDocumentCurrencyCode As Map In DocumentCurrencyCode
			Dim s_ As String = colDocumentCurrencyCode.Get("_")
			Log($"DocumentCurrencyCode: ${s_}"$)
		Next
		Dim TaxCurrencyCode As List = colInvoice.Get("TaxCurrencyCode")
		For Each colTaxCurrencyCode As Map In TaxCurrencyCode
			Dim s_ As String = colTaxCurrencyCode.Get("_")
			Log($"TaxCurrencyCode: ${s_}"$)
		Next
		Dim InvoicePeriod As List = colInvoice.Get("InvoicePeriod")
		'Log("[InvoicePeriod]")
		For Each colInvoicePeriod As Map In InvoicePeriod
			Dim StartDate As List = colInvoicePeriod.Get("StartDate")
			'Log("  [StartDate]")
			For Each colStartDate As Map In StartDate
				Dim s_ As String = colStartDate.Get("_")
				Log($"  StartDate: ${s_}"$)
			Next
			'Log("  [/StartDate]")
			Dim EndDate As List = colInvoicePeriod.Get("EndDate")
			For Each colEndDate As Map In EndDate
				Dim s_ As String = colEndDate.Get("_")
				Log($"  EndDate: ${s_}"$)
			Next
			Dim Description As List = colInvoicePeriod.Get("Description")
			For Each colDescription As Map In Description
				Dim s_ As String = colDescription.Get("_")
				Log($"  Description: ${s_}"$)
			Next
		Next
		'Log("[/InvoicePeriod]")
		Dim BillingReference As List = colInvoice.Get("BillingReference")
		'Log("[BillingReference]")
		For Each colBillingReference As Map In BillingReference
			Dim AdditionalDocumentReference As List = colBillingReference.Get("AdditionalDocumentReference")
			'Log("  [AdditionalDocumentReference]")
			For Each colAdditionalDocumentReference As Map In AdditionalDocumentReference
				Dim ID As List = colAdditionalDocumentReference.Get("ID")
				'Log("    [ID]")
				For Each colID As Map In ID
					Dim s_ As String = colID.Get("_")
					Log($"    ID: ${s_}"$)
				Next
				'Log("    [/ID]")
			Next
			'Log("  [/AdditionalDocumentReference]")
		Next
		'Log("[/BillingReference]")
				
		Dim TaxTotal As List = colInvoice.Get("TaxTotal")
		For Each colTaxTotal As Map In TaxTotal
			Dim TaxSubtotal As List = colTaxTotal.Get("TaxSubtotal")
			For Each colTaxSubtotal As Map In TaxSubtotal
				Dim TaxAmount As List = colTaxSubtotal.Get("TaxAmount")
				For Each colTaxAmount As Map In TaxAmount
					Dim currencyID As String = colTaxAmount.Get("currencyID")
					Dim d_ As Double = colTaxAmount.Get("_")
					Log("currencyID: " & currencyID)
					Log("TaxAmount: " & d_)
				Next
				Dim TaxableAmount As List = colTaxSubtotal.Get("TaxableAmount")
				For Each colTaxableAmount As Map In TaxableAmount
					Dim currencyID As String = colTaxableAmount.Get("currencyID")
					Dim d_ As Double = colTaxableAmount.Get("_")
					Log("currencyID: " & currencyID)
					Log("TaxableAmount: " & d_)
				Next
				Dim TaxCategory As List = colTaxSubtotal.Get("TaxCategory")
				For Each colTaxCategory As Map In TaxCategory
					Dim TaxScheme As List = colTaxCategory.Get("TaxScheme")
					For Each colTaxScheme As Map In TaxScheme
						Dim ID As List = colTaxScheme.Get("ID")
						For Each colID As Map In ID
							Dim schemeAgencyID As String = colID.Get("schemeAgencyID")
							Dim schemeID As String = colID.Get("schemeID")
							Dim s_ As String = colID.Get("_")
							Log("schemeAgencyID: " & schemeAgencyID)
							Log("schemeID: " & schemeID)
							Log("TaxScheme: " & s_)
						Next
					Next
					Dim ID As List = colTaxCategory.Get("ID")
					For Each colID As Map In ID
						Dim s_ As String = colID.Get("_")
						Log("TaxCategory ID: " & s_)
					Next
				Next
			Next
			Dim TaxAmount As List = colTaxTotal.Get("TaxAmount")
			For Each colTaxAmount As Map In TaxAmount
				Dim currencyID As String = colTaxAmount.Get("currencyID")
				Dim d_ As Double = colTaxAmount.Get("_")
			Next
		Next
		Dim InvoiceLine As List = colInvoice.Get("InvoiceLine")
		For Each colInvoiceLine As Map In InvoiceLine
			Dim ItemPriceExtension As List = colInvoiceLine.Get("ItemPriceExtension")
			For Each colItemPriceExtension As Map In ItemPriceExtension
				Dim Amount As List = colItemPriceExtension.Get("Amount")
				For Each colAmount As Map In Amount
					Dim currencyID As String = colAmount.Get("currencyID")
					Dim i_ As Int = colAmount.Get("_")
				Next
			Next
			Dim TaxTotal As List = colInvoiceLine.Get("TaxTotal")
			For Each colTaxTotal As Map In TaxTotal
				Dim TaxSubtotal As List = colTaxTotal.Get("TaxSubtotal")
				For Each colTaxSubtotal As Map In TaxSubtotal
					Dim TaxAmount As List = colTaxSubtotal.Get("TaxAmount")
					For Each colTaxAmount As Map In TaxAmount
						Dim currencyID As String = colTaxAmount.Get("currencyID")
						Dim d_ As Double = colTaxAmount.Get("_")
					Next
					Dim Percent As List = colTaxSubtotal.Get("Percent")
					For Each colPercent As Map In Percent
						Dim i_ As Int = colPercent.Get("_")
					Next
					Dim TaxableAmount As List = colTaxSubtotal.Get("TaxableAmount")
					For Each colTaxableAmount As Map In TaxableAmount
						Dim currencyID As String = colTaxableAmount.Get("currencyID")
						Dim d_ As Double = colTaxableAmount.Get("_")
					Next
					Dim TaxCategory As List = colTaxSubtotal.Get("TaxCategory")
					For Each colTaxCategory As Map In TaxCategory
						Dim TaxScheme As List = colTaxCategory.Get("TaxScheme")
						For Each colTaxScheme As Map In TaxScheme
							Dim ID As List = colTaxScheme.Get("ID")
							For Each colID As Map In ID
								Dim schemeAgencyID As String = colID.Get("schemeAgencyID")
								Dim schemeID As String = colID.Get("schemeID")
								Dim s_ As String = colID.Get("_")
							Next
						Next
						Dim TaxExemptionReason As List = colTaxCategory.Get("TaxExemptionReason")
						For Each colTaxExemptionReason As Map In TaxExemptionReason
							Dim s_ As String = colTaxExemptionReason.Get("_")
						Next
						Dim ID As List = colTaxCategory.Get("ID")
						For Each colID As Map In ID
							Dim s_ As String = colID.Get("_")
						Next
					Next
				Next
				Dim TaxAmount As List = colTaxTotal.Get("TaxAmount")
				For Each colTaxAmount As Map In TaxAmount
					Dim currencyID As String = colTaxAmount.Get("currencyID")
					Dim d_ As Double = colTaxAmount.Get("_")
				Next
			Next
			Dim Item As List = colInvoiceLine.Get("Item")
			For Each colItem As Map In Item
				Dim Description As List = colItem.Get("Description")
				For Each colDescription As Map In Description
					Dim s_ As String = colDescription.Get("_")
				Next
				Dim CommodityClassification As List = colItem.Get("CommodityClassification")
				For Each colCommodityClassification As Map In CommodityClassification
					Dim ItemClassificationCode As List = colCommodityClassification.Get("ItemClassificationCode")
					For Each colItemClassificationCode As Map In ItemClassificationCode
						Dim listID As String = colItemClassificationCode.Get("listID")
						Dim s_ As String = colItemClassificationCode.Get("_")
					Next
				Next
				Dim OriginCountry As List = colItem.Get("OriginCountry")
				For Each colOriginCountry As Map In OriginCountry
					Dim IdentificationCode As List = colOriginCountry.Get("IdentificationCode")
					For Each colIdentificationCode As Map In IdentificationCode
						Dim s_ As String = colIdentificationCode.Get("_")
					Next
				Next
			Next
			Dim InvoicedQuantity As List = colInvoiceLine.Get("InvoicedQuantity")
			For Each colInvoicedQuantity As Map In InvoicedQuantity
				Dim unitCode As String = colInvoicedQuantity.Get("unitCode")
				Dim i_ As Int = colInvoicedQuantity.Get("_")
				Log("unitCode: " & unitCode)
				Log("InvoicedQuantity: " & i_)
			Next
			Dim LineExtensionAmount As List = colInvoiceLine.Get("LineExtensionAmount")
			For Each colLineExtensionAmount As Map In LineExtensionAmount
				Dim currencyID As String = colLineExtensionAmount.Get("currencyID")
				Dim d_ As Double = colLineExtensionAmount.Get("_")
			Next
			Dim Price As List = colInvoiceLine.Get("Price")
			For Each colPrice As Map In Price
				Dim PriceAmount As List = colPrice.Get("PriceAmount")
				For Each colPriceAmount As Map In PriceAmount
					Dim currencyID As String = colPriceAmount.Get("currencyID")
					Dim i_ As Int = colPriceAmount.Get("_")
				Next
			Next
			Dim AllowanceCharge As List = colInvoiceLine.Get("AllowanceCharge")
			For Each colAllowanceCharge As Map In AllowanceCharge
				Dim AllowanceChargeReason As List = colAllowanceCharge.Get("AllowanceChargeReason")
				For Each colAllowanceChargeReason As Map In AllowanceChargeReason
					Dim s_ As String = colAllowanceChargeReason.Get("_")
				Next
				Dim MultiplierFactorNumeric As List = colAllowanceCharge.Get("MultiplierFactorNumeric")
				For Each colMultiplierFactorNumeric As Map In MultiplierFactorNumeric
					Dim d_ As Double = colMultiplierFactorNumeric.Get("_")
				Next
				Dim Amount As List = colAllowanceCharge.Get("Amount")
				For Each colAmount As Map In Amount
					Dim currencyID As String = colAmount.Get("currencyID")
					Dim i_ As Int = colAmount.Get("_")
				Next
				Dim ChargeIndicator As List = colAllowanceCharge.Get("ChargeIndicator")
				For Each colChargeIndicator As Map In ChargeIndicator
					Dim s_ As String = colChargeIndicator.Get("_")
				Next
			Next
			Dim ID As List = colInvoiceLine.Get("ID")
			For Each colID As Map In ID
				Dim s_ As String = colID.Get("_")
			Next
		Next

		Dim AllowanceCharge As List = colInvoice.Get("AllowanceCharge")
		For Each colAllowanceCharge As Map In AllowanceCharge
			Dim AllowanceChargeReason As List = colAllowanceCharge.Get("AllowanceChargeReason")
			For Each colAllowanceChargeReason As Map In AllowanceChargeReason
				Dim s_ As String = colAllowanceChargeReason.Get("_")
			Next
			Dim Amount As List = colAllowanceCharge.Get("Amount")
			For Each colAmount As Map In Amount
				Dim currencyID As String = colAmount.Get("currencyID")
				Dim i_ As Int = colAmount.Get("_")
			Next
			Dim ChargeIndicator As List = colAllowanceCharge.Get("ChargeIndicator")
			For Each colChargeIndicator As Map In ChargeIndicator
				Dim s_ As String = colChargeIndicator.Get("_")
			Next
		Next

		Dim PaymentTerms As List = colInvoice.Get("PaymentTerms")
		For Each colPaymentTerms As Map In PaymentTerms
			Dim Note As List = colPaymentTerms.Get("Note")
			For Each colNote As Map In Note
				Dim s_ As String = colNote.Get("_")
			Next
		Next
		Dim PrepaidPayment As List = colInvoice.Get("PrepaidPayment")
		For Each colPrepaidPayment As Map In PrepaidPayment
			Dim PaidDate As List = colPrepaidPayment.Get("PaidDate")
			For Each colPaidDate As Map In PaidDate
				Dim s_ As String = colPaidDate.Get("_")
			Next
			Dim PaidTime As List = colPrepaidPayment.Get("PaidTime")
			For Each colPaidTime As Map In PaidTime
				Dim s_ As String = colPaidTime.Get("_")
			Next
			Dim ID As List = colPrepaidPayment.Get("ID")
			For Each colID As Map In ID
				Dim s_ As String = colID.Get("_")
			Next
			Dim PaidAmount As List = colPrepaidPayment.Get("PaidAmount")
			For Each colPaidAmount As Map In PaidAmount
				Dim currencyID As String = colPaidAmount.Get("currencyID")
				Dim i_ As Int = colPaidAmount.Get("_")
			Next
		Next
		Dim AccountingSupplierParty As List = colInvoice.Get("AccountingSupplierParty")
		For Each colAccountingSupplierParty As Map In AccountingSupplierParty
			Dim Party As List = colAccountingSupplierParty.Get("Party")
			For Each colParty As Map In Party
				Dim PostalAddress As List = colParty.Get("PostalAddress")
				For Each colPostalAddress As Map In PostalAddress
					Dim AddressLine As List = colPostalAddress.Get("AddressLine")
					For Each colAddressLine As Map In AddressLine
						Dim Line As List = colAddressLine.Get("Line")
						For Each colLine As Map In Line
							Dim s_ As String = colLine.Get("_")
						Next
					Next
					Dim CountrySubentityCode As List = colPostalAddress.Get("CountrySubentityCode")
					For Each colCountrySubentityCode As Map In CountrySubentityCode
						Dim s_ As String = colCountrySubentityCode.Get("_")
					Next
					Dim Country As List = colPostalAddress.Get("Country")
					For Each colCountry As Map In Country
						Dim IdentificationCode As List = colCountry.Get("IdentificationCode")
						For Each colIdentificationCode As Map In IdentificationCode
							Dim listID As String = colIdentificationCode.Get("listID")
							Dim listAgencyID As String = colIdentificationCode.Get("listAgencyID")
							Dim s_ As String = colIdentificationCode.Get("_")
						Next
					Next
					Dim CityName As List = colPostalAddress.Get("CityName")
					For Each colCityName As Map In CityName
						Dim s_ As String = colCityName.Get("_")
					Next
					Dim PostalZone As List = colPostalAddress.Get("PostalZone")
					For Each colPostalZone As Map In PostalZone
						Dim s_ As String = colPostalZone.Get("_")
					Next
				Next
				Dim IndustryClassificationCode As List = colParty.Get("IndustryClassificationCode")
				For Each colIndustryClassificationCode As Map In IndustryClassificationCode
					Dim name As String = colIndustryClassificationCode.Get("name")
					Dim s_ As String = colIndustryClassificationCode.Get("_")
					Log("name: " & name)
					Log("IndustryClassificationCode: " & s_)
				Next
				Dim PartyLegalEntity As List = colParty.Get("PartyLegalEntity")
				For Each colPartyLegalEntity As Map In PartyLegalEntity
					Dim RegistrationName As List = colPartyLegalEntity.Get("RegistrationName")
					For Each colRegistrationName As Map In RegistrationName
						Dim s_ As String = colRegistrationName.Get("_")
					Next
				Next
				Dim PartyIdentification As List = colParty.Get("PartyIdentification")
				For Each colPartyIdentification As Map In PartyIdentification
					Dim ID As List = colPartyIdentification.Get("ID")
					For Each colID As Map In ID
						Dim schemeID As String = colID.Get("schemeID")
						Dim s_ As String = colID.Get("_")
					Next
				Next
				Dim Contact As List = colParty.Get("Contact")
				For Each colContact As Map In Contact
					Dim Telephone As List = colContact.Get("Telephone")
					For Each colTelephone As Map In Telephone
						Dim s_ As String = colTelephone.Get("_")
					Next
					Dim ElectronicMail As List = colContact.Get("ElectronicMail")
					For Each colElectronicMail As Map In ElectronicMail
						Dim s_ As String = colElectronicMail.Get("_")
					Next
				Next
			Next
			Dim AdditionalAccountID As List = colAccountingSupplierParty.Get("AdditionalAccountID")
			For Each colAdditionalAccountID As Map In AdditionalAccountID
				Dim s_ As String = colAdditionalAccountID.Get("_")
				Dim schemeAgencyName As String = colAdditionalAccountID.Get("schemeAgencyName")
				Log("AdditionalAccountID: " & s_)
				Log("schemeAgencyName: " & schemeAgencyName)
			Next
		Next
		Dim AccountingCustomerParty As List = colInvoice.Get("AccountingCustomerParty")
		For Each colAccountingCustomerParty As Map In AccountingCustomerParty
			Dim Party As List = colAccountingCustomerParty.Get("Party")
			For Each colParty As Map In Party
				Dim PostalAddress As List = colParty.Get("PostalAddress")
				For Each colPostalAddress As Map In PostalAddress
					Dim AddressLine As List = colPostalAddress.Get("AddressLine")
					For Each colAddressLine As Map In AddressLine
						Dim Line As List = colAddressLine.Get("Line")
						For Each colLine As Map In Line
							Dim s_ As String = colLine.Get("_")
						Next
					Next
					Dim CountrySubentityCode As List = colPostalAddress.Get("CountrySubentityCode")
					For Each colCountrySubentityCode As Map In CountrySubentityCode
						Dim s_ As String = colCountrySubentityCode.Get("_")
					Next
					Dim Country As List = colPostalAddress.Get("Country")
					For Each colCountry As Map In Country
						Dim IdentificationCode As List = colCountry.Get("IdentificationCode")
						For Each colIdentificationCode As Map In IdentificationCode
							Dim listID As String = colIdentificationCode.Get("listID")
							Dim listAgencyID As String = colIdentificationCode.Get("listAgencyID")
							Dim s_ As String = colIdentificationCode.Get("_")
						Next
					Next
					Dim CityName As List = colPostalAddress.Get("CityName")
					For Each colCityName As Map In CityName
						Dim s_ As String = colCityName.Get("_")
					Next
					Dim PostalZone As List = colPostalAddress.Get("PostalZone")
					For Each colPostalZone As Map In PostalZone
						Dim s_ As String = colPostalZone.Get("_")
					Next
				Next
				Dim PartyLegalEntity As List = colParty.Get("PartyLegalEntity")
				For Each colPartyLegalEntity As Map In PartyLegalEntity
					Dim RegistrationName As List = colPartyLegalEntity.Get("RegistrationName")
					For Each colRegistrationName As Map In RegistrationName
						Dim s_ As String = colRegistrationName.Get("_")
					Next
				Next
				Dim PartyIdentification As List = colParty.Get("PartyIdentification")
				For Each colPartyIdentification As Map In PartyIdentification
					Dim ID As List = colPartyIdentification.Get("ID")
					For Each colID As Map In ID
						Dim schemeID As String = colID.Get("schemeID")
						Dim s_ As String = colID.Get("_")
					Next
				Next
				Dim Contact As List = colParty.Get("Contact")
				For Each colContact As Map In Contact
					Dim Telephone As List = colContact.Get("Telephone")
					For Each colTelephone As Map In Telephone
						Dim s_ As String = colTelephone.Get("_")
					Next
					Dim ElectronicMail As List = colContact.Get("ElectronicMail")
					For Each colElectronicMail As Map In ElectronicMail
						Dim s_ As String = colElectronicMail.Get("_")
					Next
				Next
			Next
		Next
		Dim PaymentMeans As List = colInvoice.Get("PaymentMeans")
		For Each colPaymentMeans As Map In PaymentMeans
			Dim PayeeFinancialAccount As List = colPaymentMeans.Get("PayeeFinancialAccount")
			For Each colPayeeFinancialAccount As Map In PayeeFinancialAccount
				Dim ID As List = colPayeeFinancialAccount.Get("ID")
				For Each colID As Map In ID
					Dim s_ As String = colID.Get("_")
				Next
			Next
			Dim PaymentMeansCode As List = colPaymentMeans.Get("PaymentMeansCode")
			For Each colPaymentMeansCode As Map In PaymentMeansCode
				Dim s_ As String = colPaymentMeansCode.Get("_")
			Next
		Next
		Dim LegalMonetaryTotal As List = colInvoice.Get("LegalMonetaryTotal")
		For Each colLegalMonetaryTotal As Map In LegalMonetaryTotal
			Dim TaxInclusiveAmount As List = colLegalMonetaryTotal.Get("TaxInclusiveAmount")
			For Each colTaxInclusiveAmount As Map In TaxInclusiveAmount
				Dim currencyID As String = colTaxInclusiveAmount.Get("currencyID")
				Dim d_ As Double = colTaxInclusiveAmount.Get("_")
			Next
			Dim LineExtensionAmount As List = colLegalMonetaryTotal.Get("LineExtensionAmount")
			For Each colLineExtensionAmount As Map In LineExtensionAmount
				Dim currencyID As String = colLineExtensionAmount.Get("currencyID")
				Dim d_ As Double = colLineExtensionAmount.Get("_")
			Next
			Dim AllowanceTotalAmount As List = colLegalMonetaryTotal.Get("AllowanceTotalAmount")
			For Each colAllowanceTotalAmount As Map In AllowanceTotalAmount
				Dim currencyID As String = colAllowanceTotalAmount.Get("currencyID")
				Dim d_ As Double = colAllowanceTotalAmount.Get("_")
			Next
			Dim ChargeTotalAmount As List = colLegalMonetaryTotal.Get("ChargeTotalAmount")
			For Each colChargeTotalAmount As Map In ChargeTotalAmount
				Dim currencyID As String = colChargeTotalAmount.Get("currencyID")
				Dim d_ As Double = colChargeTotalAmount.Get("_")
			Next
			Dim TaxExclusiveAmount As List = colLegalMonetaryTotal.Get("TaxExclusiveAmount")
			For Each colTaxExclusiveAmount As Map In TaxExclusiveAmount
				Dim currencyID As String = colTaxExclusiveAmount.Get("currencyID")
				Dim d_ As Double = colTaxExclusiveAmount.Get("_")
			Next
			Dim PayableRoundingAmount As List = colLegalMonetaryTotal.Get("PayableRoundingAmount")
			For Each colPayableRoundingAmount As Map In PayableRoundingAmount
				Dim currencyID As String = colPayableRoundingAmount.Get("currencyID")
				Dim d_ As Double = colPayableRoundingAmount.Get("_")
			Next
			Dim PayableAmount As List = colLegalMonetaryTotal.Get("PayableAmount")
			For Each colPayableAmount As Map In PayableAmount
				Dim currencyID As String = colPayableAmount.Get("currencyID")
				Dim d_ As Double = colPayableAmount.Get("_")
			Next
		Next

		Dim Delivery As List = colInvoice.Get("Delivery")
		For Each colDelivery As Map In Delivery
			Dim DeliveryParty As List = colDelivery.Get("DeliveryParty")
			For Each colDeliveryParty As Map In DeliveryParty
				Dim PostalAddress As List = colDeliveryParty.Get("PostalAddress")
				For Each colPostalAddress As Map In PostalAddress
					Dim AddressLine As List = colPostalAddress.Get("AddressLine")
					For Each colAddressLine As Map In AddressLine
						Dim Line As List = colAddressLine.Get("Line")
						For Each colLine As Map In Line
							Dim s_ As String = colLine.Get("_")
						Next
					Next
					Dim CountrySubentityCode As List = colPostalAddress.Get("CountrySubentityCode")
					For Each colCountrySubentityCode As Map In CountrySubentityCode
						Dim s_ As String = colCountrySubentityCode.Get("_")
					Next
					Dim Country As List = colPostalAddress.Get("Country")
					For Each colCountry As Map In Country
						Dim IdentificationCode As List = colCountry.Get("IdentificationCode")
						For Each colIdentificationCode As Map In IdentificationCode
							Dim listID As String = colIdentificationCode.Get("listID")
							Dim listAgencyID As String = colIdentificationCode.Get("listAgencyID")
							Dim s_ As String = colIdentificationCode.Get("_")
							Log("listID: " & listID)
							Log("listAgencyID: " & listAgencyID)
							Log("IdentificationCode: " & s_)
						Next
					Next
					Dim CityName As List = colPostalAddress.Get("CityName")
					For Each colCityName As Map In CityName
						Dim s_ As String = colCityName.Get("_")
					Next
					Dim PostalZone As List = colPostalAddress.Get("PostalZone")
					For Each colPostalZone As Map In PostalZone
						Dim s_ As String = colPostalZone.Get("_")
					Next
				Next
				Dim PartyLegalEntity As List = colDeliveryParty.Get("PartyLegalEntity")
				For Each colPartyLegalEntity As Map In PartyLegalEntity
					Dim RegistrationName As List = colPartyLegalEntity.Get("RegistrationName")
					For Each colRegistrationName As Map In RegistrationName
						Dim s_ As String = colRegistrationName.Get("_")
					Next
				Next
				Dim PartyIdentification As List = colDeliveryParty.Get("PartyIdentification")
				For Each colPartyIdentification As Map In PartyIdentification
					Dim ID As List = colPartyIdentification.Get("ID")
					For Each colID As Map In ID
						Dim schemeID As String = colID.Get("schemeID")
						Dim s_ As String = colID.Get("_")
					Next
				Next
			Next
			Dim Shipment As List = colDelivery.Get("Shipment")
			For Each colShipment As Map In Shipment
				Dim FreightAllowanceCharge As List = colShipment.Get("FreightAllowanceCharge")
				For Each colFreightAllowanceCharge As Map In FreightAllowanceCharge
					Dim AllowanceChargeReason As List = colFreightAllowanceCharge.Get("AllowanceChargeReason")
					For Each colAllowanceChargeReason As Map In AllowanceChargeReason
						Dim s_ As String = colAllowanceChargeReason.Get("_")
					Next
					Dim Amount As List = colFreightAllowanceCharge.Get("Amount")
					For Each colAmount As Map In Amount
						Dim currencyID As String = colAmount.Get("currencyID")
						Dim i_ As Int = colAmount.Get("_")
						Log("Amount: " & i_)
					Next
					Dim ChargeIndicator As List = colFreightAllowanceCharge.Get("ChargeIndicator")
					For Each colChargeIndicator As Map In ChargeIndicator
						Dim s_ As String = colChargeIndicator.Get("_")
					Next
				Next
				Dim ID As List = colShipment.Get("ID")
				For Each colID As Map In ID
					Dim s_ As String = colID.Get("_")
				Next
			Next
		Next

		Dim AdditionalDocumentReference As List = colInvoice.Get("AdditionalDocumentReference")
		For Each colAdditionalDocumentReference As Map In AdditionalDocumentReference
			Dim ID As List = colAdditionalDocumentReference.Get("ID")
			For Each colID As Map In ID
				Dim s_ As String = colID.Get("_")
				Log("colID: " & s_)
			Next
			Dim DocumentType As List = colAdditionalDocumentReference.Get("DocumentType")
			If DocumentType.IsInitialized Then ' ID=CIF doesn't have DocumentType
				For Each colDocumentType As Map In DocumentType
					Dim s_ As String = colDocumentType.Get("_")
					Log("colDocumentType: " & s_)
				Next
			End If
		Next
	Next
End Sub

Public Sub GenerateContent As String
	Return $"{
  "_D": "urn:oasis:names:specification:ubl:schema:xsd:Invoice-2",
  "_A": "urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2",
  "_B": "urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2",
  "Invoice": [
    {
      "ID": [
        {
          "_": "JSON-INV12345"
        }
      ],
      "IssueDate": [
        {
          "_": "2024-07-23"
        }
      ],
      "IssueTime": [
        {
          "_": "00:30:00Z"
        }
      ],
      "InvoiceTypeCode": [
        {
          "_": "01",
          "listVersionID": "1.0"
        }
      ],
      "DocumentCurrencyCode": [
        {
          "_": "MYR"
        }
      ],
      "TaxCurrencyCode": [
        {
          "_": "MYR"
        }
      ],
      "InvoicePeriod": [
        {
          "StartDate": [
            {
              "_": "2024-01-01"
            }
          ],
          "EndDate": [
            {
              "_": "2024-07-31"
            }
          ],
          "Description": [
            {
              "_": "Monthly"
            }
          ]
        }
      ],
      "BillingReference": [
        {
          "AdditionalDocumentReference": [
            {
              "ID": [
                {
                  "_": "E12345678912"
                }
              ]
            }
          ]
        }
      ],
      "AdditionalDocumentReference": [
        {
          "ID": [
            {
              "_": "E12345678912"
            }
          ],
          "DocumentType": [
            {
              "_": "CustomsImportForm"
            }
          ]
        },
        {
          "ID": [
            {
              "_": "sa313321312"
            }
          ],
          "DocumentType": [
            {
              "_": "213312dddddd"
            }
          ],
          "DocumentDescription": [
            {
              "_": "asddasdwqfd ddq"
            }
          ]
        },
        {
          "ID": [
            {
              "_": "E12345678912"
            }
          ],
          "DocumentType": [
            {
              "_": "K2"
            }
          ]
        },
        {
          "ID": [
            {
              "_": "CIF"
            }
          ]
        }
      ],
      "AccountingSupplierParty": [
        {
          "AdditionalAccountID": [
            {
              "_": "CPT-CCN-W-211111-KL-000002",
              "schemeAgencyName": "CertEX"
            }
          ],
          "Party": [
            {
              "IndustryClassificationCode": [
                {
                  "_": "46510",
                  "name": "Wholesale of computer hardware, software and peripherals"
                }
              ],
              "PartyIdentification": [
                {
                  "ID": [
                    {
                      "_": "Supplier's TIN",
                      "schemeID": "TIN"
                    }
                  ]
                },
                {
                  "ID": [
                    {
                      "_": "Supplier's BRN",
                      "schemeID": "BRN"
                    }
                  ]
                },
                {
                  "ID": [
                    {
                      "_": "NA",
                      "schemeID": "SST"
                    }
                  ]
                },
                {
                  "ID": [
                    {
                      "_": "NA",
                      "schemeID": "TTX"
                    }
                  ]
                }
              ],
              "PostalAddress": [
                {
                  "CityName": [
                    {
                      "_": "Kuala Lumpur"
                    }
                  ],
                  "PostalZone": [
                    {
                      "_": "50480"
                    }
                  ],
                  "CountrySubentityCode": [
                    {
                      "_": "10"
                    }
                  ],
                  "AddressLine": [
                    {
                      "Line": [
                        {
                          "_": "Lot 66"
                        }
                      ]
                    },
                    {
                      "Line": [
                        {
                          "_": "Bangunan Merdeka"
                        }
                      ]
                    },
                    {
                      "Line": [
                        {
                          "_": "Persiaran Jaya"
                        }
                      ]
                    }
                  ],
                  "Country": [
                    {
                      "IdentificationCode": [
                        {
                          "_": "MYS",
                          "listID": "ISO3166-1",
                          "listAgencyID": "6"
                        }
                      ]
                    }
                  ]
                }
              ],
              "PartyLegalEntity": [
                {
                  "RegistrationName": [
                    {
                      "_": "Supplier's Name"
                    }
                  ]
                }
              ],
              "Contact": [
                {
                  "Telephone": [
                    {
                      "_": "+60-123456789"
                    }
                  ],
                  "ElectronicMail": [
                    {
                      "_": "supplier@email.com"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ],
      "AccountingCustomerParty": [
        {
          "Party": [
            {
              "PostalAddress": [
                {
                  "CityName": [
                    {
                      "_": "Kuala Lumpur"
                    }
                  ],
                  "PostalZone": [
                    {
                      "_": "50480"
                    }
                  ],
                  "CountrySubentityCode": [
                    {
                      "_": "10"
                    }
                  ],
                  "AddressLine": [
                    {
                      "Line": [
                        {
                          "_": "Lot 66"
                        }
                      ]
                    },
                    {
                      "Line": [
                        {
                          "_": "Bangunan Merdeka"
                        }
                      ]
                    },
                    {
                      "Line": [
                        {
                          "_": "Persiaran Jaya"
                        }
                      ]
                    }
                  ],
                  "Country": [
                    {
                      "IdentificationCode": [
                        {
                          "_": "MYS",
                          "listID": "ISO3166-1",
                          "listAgencyID": "6"
                        }
                      ]
                    }
                  ]
                }
              ],
              "PartyLegalEntity": [
                {
                  "RegistrationName": [
                    {
                      "_": "Buyer's Name"
                    }
                  ]
                }
              ],
              "PartyIdentification": [
                {
                  "ID": [
                    {
                      "_": "Buyer's TIN",
                      "schemeID": "TIN"
                    }
                  ]
                },
                {
                  "ID": [
                    {
                      "_": "Buyer's BRN",
                      "schemeID": "BRN"
                    }
                  ]
                },
                {
                  "ID": [
                    {
                      "_": "NA",
                      "schemeID": "SST"
                    }
                  ]
                },
                {
                  "ID": [
                    {
                      "_": "NA",
                      "schemeID": "TTX"
                    }
                  ]
                }
              ],
              "Contact": [
                {
                  "Telephone": [
                    {
                      "_": "+60-123456789"
                    }
                  ],
                  "ElectronicMail": [
                    {
                      "_": "buyer@email.com"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ],
      "Delivery": [
        {
          "DeliveryParty": [
            {
              "PartyLegalEntity": [
                {
                  "RegistrationName": [
                    {
                      "_": "Recipient's Name"
                    }
                  ]
                }
              ],
              "PostalAddress": [
                {
                  "CityName": [
                    {
                      "_": "Kuala Lumpur"
                    }
                  ],
                  "PostalZone": [
                    {
                      "_": "50480"
                    }
                  ],
                  "CountrySubentityCode": [
                    {
                      "_": "10"
                    }
                  ],
                  "AddressLine": [
                    {
                      "Line": [
                        {
                          "_": "Lot 66"
                        }
                      ]
                    },
                    {
                      "Line": [
                        {
                          "_": "Bangunan Merdeka"
                        }
                      ]
                    },
                    {
                      "Line": [
                        {
                          "_": "Persiaran Jaya"
                        }
                      ]
                    }
                  ],
                  "Country": [
                    {
                      "IdentificationCode": [
                        {
                          "_": "MYS",
                          "listID": "ISO3166-1",
                          "listAgencyID": "6"
                        }
                      ]
                    }
                  ]
                }
              ],
              "PartyIdentification": [
                {
                  "ID": [
                    {
                      "_": "Recipient's TIN",
                      "schemeID": "TIN"
                    }
                  ]
                },
                {
                  "ID": [
                    {
                      "_": "Recipient's BRN",
                      "schemeID": "BRN"
                    }
                  ]
                }
              ]
            }
          ],
          "Shipment": [
            {
              "ID": [
                {
                  "_": "1234"
                }
              ],
              "FreightAllowanceCharge": [
                {
                  "ChargeIndicator": [
                    {
                      "_": true
                    }
                  ],
                  "AllowanceChargeReason": [
                    {
                      "_": "Service charge"
                    }
                  ],
                  "Amount": [
                    {
                      "_": 100,
                      "currencyID": "MYR"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ],
      "PaymentMeans": [
        {
          "PaymentMeansCode": [
            {
              "_": "03"
            }
          ],
          "PayeeFinancialAccount": [
            {
              "ID": [
                {
                  "_": "1234567890123"
                }
              ]
            }
          ]
        }
      ],
      "PaymentTerms": [
        {
          "Note": [
            {
              "_": "Payment method is cash"
            }
          ]
        }
      ],
      "PrepaidPayment": [
        {
          "ID": [
            {
              "_": "E12345678912"
            }
          ],
          "PaidAmount": [
            {
              "_": 1,
              "currencyID": "MYR"
            }
          ],
          "PaidDate": [
            {
              "_": "2024-07-23"
            }
          ],
          "PaidTime": [
            {
              "_": "00:30:00Z"
            }
          ]
        }
      ],
      "AllowanceCharge": [
        {
          "ChargeIndicator": [
            {
              "_": false
            }
          ],
          "AllowanceChargeReason": [
            {
              "_": "Sample Description"
            }
          ],
          "Amount": [
            {
              "_": 100,
              "currencyID": "MYR"
            }
          ]
        },
        {
          "ChargeIndicator": [
            {
              "_": true
            }
          ],
          "AllowanceChargeReason": [
            {
              "_": "Service charge"
            }
          ],
          "Amount": [
            {
              "_": 100,
              "currencyID": "MYR"
            }
          ]
        }
      ],
      "TaxTotal": [
        {
          "TaxAmount": [
            {
              "_": 87.63,
              "currencyID": "MYR"
            }
          ],
          "TaxSubtotal": [
            {
              "TaxableAmount": [
                {
                  "_": 87.63,
                  "currencyID": "MYR"
                }
              ],
              "TaxAmount": [
                {
                  "_": 87.63,
                  "currencyID": "MYR"
                }
              ],
              "TaxCategory": [
                {
                  "ID": [
                    {
                      "_": "01"
                    }
                  ],
                  "TaxScheme": [
                    {
                      "ID": [
                        {
                          "_": "OTH",
                          "schemeID": "UN/ECE 5153",
                          "schemeAgencyID": "6"
                        }
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        }
      ],
      "LegalMonetaryTotal": [
        {
          "LineExtensionAmount": [
            {
              "_": 1436.5,
              "currencyID": "MYR"
            }
          ],
          "TaxExclusiveAmount": [
            {
              "_": 1436.5,
              "currencyID": "MYR"
            }
          ],
          "TaxInclusiveAmount": [
            {
              "_": 1436.5,
              "currencyID": "MYR"
            }
          ],
          "AllowanceTotalAmount": [
            {
              "_": 1436.5,
              "currencyID": "MYR"
            }
          ],
          "ChargeTotalAmount": [
            {
              "_": 1436.5,
              "currencyID": "MYR"
            }
          ],
          "PayableRoundingAmount": [
            {
              "_": 0.3,
              "currencyID": "MYR"
            }
          ],
          "PayableAmount": [
            {
              "_": 1436.5,
              "currencyID": "MYR"
            }
          ]
        }
      ],
      "InvoiceLine": [
        {
          "ID": [
            {
              "_": "1234"
            }
          ],
          "InvoicedQuantity": [
            {
              "_": 1,
              "unitCode": "C62"
            }
          ],
          "LineExtensionAmount": [
            {
              "_": 1436.5,
              "currencyID": "MYR"
            }
          ],
          "AllowanceCharge": [
            {
              "ChargeIndicator": [
                {
                  "_": false
                }
              ],
              "AllowanceChargeReason": [
                {
                  "_": "Sample Description"
                }
              ],
              "MultiplierFactorNumeric": [
                {
                  "_": 0.15
                }
              ],
              "Amount": [
                {
                  "_": 100,
                  "currencyID": "MYR"
                }
              ]
            },
            {
              "ChargeIndicator": [
                {
                  "_": true
                }
              ],
              "AllowanceChargeReason": [
                {
                  "_": "Sample Description"
                }
              ],
              "MultiplierFactorNumeric": [
                {
                  "_": 0.1
                }
              ],
              "Amount": [
                {
                  "_": 100,
                  "currencyID": "MYR"
                }
              ]
            }
          ],
          "TaxTotal": [
            {
              "TaxAmount": [
                {
                  "_": 1460.5,
                  "currencyID": "MYR"
                }
              ],
              "TaxSubtotal": [
                {
                  "TaxableAmount": [
                    {
                      "_": 1460.5,
                      "currencyID": "MYR"
                    }
                  ],
                  "TaxAmount": [
                    {
                      "_": 1460.5,
                      "currencyID": "MYR"
                    }
                  ],
                  "Percent": [
                    {
                      "_": 6
                    }
                  ],
                  "TaxCategory": [
                    {
                      "ID": [
                        {
                          "_": "E"
                        }
                      ],
                      "TaxExemptionReason": [
                        {
                          "_": "Exempt New Means of Transport"
                        }
                      ],
                      "TaxScheme": [
                        {
                          "ID": [
                            {
                              "_": "OTH",
                              "schemeID": "UN/ECE 5153",
                              "schemeAgencyID": "6"
                            }
                          ]
                        }
                      ]
                    }
                  ]
                }
              ]
            }
          ],
          "Item": [
            {
              "CommodityClassification": [
                {
                  "ItemClassificationCode": [
                    {
                      "_": "9800.00.0010",
                      "listID": "PTC"
                    }
                  ]
                },
                {
                  "ItemClassificationCode": [
                    {
                      "_": "003",
                      "listID": "CLASS"
                    }
                  ]
                }
              ],
              "Description": [
                {
                  "_": "Laptop Peripherals"
                }
              ],
              "OriginCountry": [
                {
                  "IdentificationCode": [
                    {
                      "_": "MYS"
                    }
                  ]
                }
              ]
            }
          ],
          "Price": [
            {
              "PriceAmount": [
                {
                  "_": 17,
                  "currencyID": "MYR"
                }
              ]
            }
          ],
          "ItemPriceExtension": [
            {
              "Amount": [
                {
                  "_": 100,
                  "currencyID": "MYR"
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}"$
End Sub