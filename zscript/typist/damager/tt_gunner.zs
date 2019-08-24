/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019
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

/** This class is an implementation of tt_Damager interface.
 *
 * It fires at the origin received from the OriginSource with
 * the help of Aimer and Firer classes.
 */
class tt_Gunner : tt_Damager
{

// public: /////////////////////////////////////////////////////////////////////

  tt_Gunner init(tt_OriginSource originSource, tt_Aimer aimer, tt_Firer firer)
  {
    _originSource = originSource;
    _aimer        = aimer;
    _firer        = firer;

    return self;
  }

// public: // tt_Damager ///////////////////////////////////////////////////////

  override
  void damage()
  {
    let origin = _originSource.getOrigin();
    if (origin == NULL) { return; }

    _aimer.aim();
    _firer.fire();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_OriginSource _originSource;
  private tt_Aimer        _aimer;
  private tt_Firer        _firer;

} // class tt_GunnerImpl