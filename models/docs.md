{% docs dim_listing_cleansed__minimum_nights %}

Minimum number of nights required to rent this property.
Keep in mind that old listings might have `minimum_nights` set
to 0 in the source tables. Our cleansing algorithm updates this to `1`.

{% enddocs %}

{% docs dim_listing_cleansed__roomtype %}

Only pre-defined room types are allowed only.
Such as Entire home/apt, Private, Shared, Hotel.

{% enddocs %}