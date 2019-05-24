import "bootstrap";

import { flyout } from '../plugins/flyout';
import { showHide } from '../plugins/beverage';
import { addCharacterPreference } from '../plugins/preference';
import { addInterestPreference } from '../plugins/preference';
import { addFoodPreference } from '../plugins/preference';
import { addBeveragePreference } from '../plugins/preference';
import { addAlcoholPreference } from '../plugins/preference';
import "../components/on_click.js";

flyout();
showHide();
addCharacterPreference();
addInterestPreference();
addFoodPreference();
addBeveragePreference();
addAlcoholPreference();
