@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BO Proj: Booking Suppl. (Processor)'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZURS_BOOKSUPPL_PROCESSOR as projection on ZURS_BOOK_SUPPL
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
    _Booking: redirected to parent ZURS_BOOKING_PROCESSOR,
    _Travel: redirected to ZURS_TRAVEL_PROCESSOR
}
 