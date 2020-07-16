<?php


function countrySelector($defaultCountry = "", $id = "", $name = "", $classes = "")
{
    global $countryArray;

    $countryArray = get_countries_list_gh();
    $output = "<select id='" . $id . "' name='" . $name . "' class='" . $classes . "'>";

    foreach ($countryArray as $code => $country) {
        $countryName = ucwords(strtolower($country["name"])); // Making it look good
        $output .= "<option data-phone-code='" . "+" . $country["code"] . "' value='" . $code . "'>" . $code . " - " . $countryName . " (+" . $country["code"] . ")</option>";
    }

    $output .= "</select>";

    return $output;
}


?>