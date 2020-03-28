/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019-2020
 *
 * This file is a part of Typist.pk3.
 *
 * Typist.pk3 is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * Typist.pk3 is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Typist.pk3.  If not, see <https://www.gnu.org/licenses/>.
 */

/**
 * This class implements tt_Dasher by specifying dash angle.
 */
class tt_RightDasher : tt_Dasher
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_RightDasher of(tt_PlayerSource playerSource)
  {
    let result = new("tt_RightDasher"); // construct

    result._playerSource = playerSource;

    return result;
  }

// public: // tt_Dasher ////////////////////////////////////////////////////////

  override
  double getDashAngle()
  {
    return -90;
  }

// public: // tt_Activatable //////////////////////////////////////////////////@

  override
  tt_Strings getCommands()
  {
    let result = tt_Strings.of();
    result.add("dr");

    return result;
  }

} // class tt_RightDasher
