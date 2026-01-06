@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BO Projection: Booking (Approver)'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZURS_BOOKING_APPR as projection on ZURS_BOOKING
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookingStatus,
    _Carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent ZURS_TRAVEL_APPR
}
