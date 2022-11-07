#loader contenttweaker
#priority 29998

import scripts.grassUtils.LoggerCot as Logger;

static pi as double = 3.14159265358979324;
static e as double =  2.71828182845904524;

function i18n(key as string) as string{
    return game.localize(key);
}

function i18nValued(key as string, values as string[]) as string {
    var value as string = i18n(key);
    var temp as string = "";
    var i as int = 0;
    var t as int = 0;
    while (i < value.length) {
        var j as string = value[i];
        var k as string = "";
        if (i + 2 <= value.length) {
            k = value.substring(i, i + 2);
        }
        if (k == "%s") {
            temp ~= values[t];
            t += 1;
            i += 1;
        } else {
            temp ~= j;
        }
        i += 1;
    }
    return temp;
}