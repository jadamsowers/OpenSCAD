/* Copyright 2021 J. Adam Sowers 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * See <http://www.gnu.org/licenses/>.
 *
 * Version 1.0.   2021-10-06  Initial version.
 *
 */

use <threads.scad>
use <rounded_corner.scad>

$fs = 0.2; // half filament extrusion width, assuming 0.4mm nozzle
$fa = 1;   
$fn = 100;


$moment_width  = 33; // mm
$moment_height = 30; // mm
$filter_size   = 77; // mm

difference()
{
                        cylinder(h=5, r = $filter_size / 2 + 1.5, center = true);
    translate([0,0,2])  cylinder(h=5, r = $filter_size / 2 - 0.5, center = true);
                        metric_thread(
                            diameter=$filter_size + 0.5, 
                            pitch=.5, 
                            length=3, 
                            internal = true);
                        roundedcube(
                            size=[$moment_width,$moment_height,5], 
                            radius = 5.5, 
                            center = true, 
                            apply_to = "z");
}