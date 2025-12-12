@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BO Projection: Travel (Processor)'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity ZURS_TRAVEL_PROCESSOR as projection on ZURS_TRAVEL
{
    @ObjectModel.text.element: [ 'Description' ]
    key TravelId,
    @ObjectModel.text.element: [ 'AgencyName' ]
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Agency',
        entity.element: 'AgencyID' }]
    AgencyId,
    @Semantics.text: true
    _Agency.Name as AgencyName,
    @ObjectModel.text.element: [ 'CustomerName' ]
    @Consumption.valueHelpDefinition: [{  
        entity.name: '/DMO/I_Customer',
        entity.element: 'CustomerID' }]
    CustomerId,
    @Semantics.text: true
    _Customer.FirstName as CustomerName,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: 'I_Currency',
        entity.element: 'Currency'    
    }]
    CurrencyCode,
    @Semantics.text: true
    Description,
    @ObjectModel.text.element: [ 'StatusText' ]
    @Consumption.valueHelpDefinition: [{  
        entity.name: '/DMO/I_Overall_Status_VH',
        entity.element: 'OverallStatus' }]
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    @Semantics.text: true
    StatusText,
    Criticality,
    /* Associations */
    _Agency,
    _Booking: redirected to composition child ZURS_BOOKING_PROCESSOR,
    _Currency,
    _Customer,
    _OverAllStatus,
//    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_URS_VE_CALC'
    @EndUserText.label: 'CO2 Tax'
    virtual CO2Tax: abap.int4,
//    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_URS_VE_CALC'
    @EndUserText.label: 'Week Day'
    virtual dayOfTheFlight: abap.char( 9 )    
}
