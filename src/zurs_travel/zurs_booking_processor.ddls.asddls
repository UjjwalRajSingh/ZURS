@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BO Projection: Booking (Processor)'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZURS_BOOKING_PROCESSOR as projection on ZURS_BOOKING
{
    key TravelId,
    key BookingId,
    BookingDate,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Customer',
        entity.element: 'CustomerID'
    }]
    CustomerId,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Carrier',
        entity.element: 'AirlineID' 
    }]
    CarrierId,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Connection',
        entity.element: 'ConnectionID',
        additionalBinding: [{
                                localElement: 'CarrierId',
                                element: 'AirlineID'
                           }]
    }]
    ConnectionId,
    FlightDate,
    FlightPrice,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: 'I_Currency',
        entity.element: 'Currency'    
    }]
    CurrencyCode,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Booking_Status_VH',
        entity.element: 'BookingStatus' 
    }]
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookingSupplement: redirected to composition child ZURS_BOOKSUPPL_PROCESSOR,
    _Booking_Status,
    _Carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent ZURS_TRAVEL_PROCESSOR
}
