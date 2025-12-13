@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BO Proj: Booking Suppl. (Processor)'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZURS_BOOKSUPPL_PROC as projection on ZURS_BOOKSUPPL
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Supplement',
        entity.element: 'SupplementID'        
    }]
    SupplementId,
    Price,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: 'I_Currency',
        entity.element: 'Currency'    
    }]
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking: redirected to parent ZURS_BOOKING_PROC,
    _Travel: redirected to ZURS_TRAVEL_PROC
}
 