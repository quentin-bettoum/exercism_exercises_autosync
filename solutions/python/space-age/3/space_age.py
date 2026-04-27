from dataclasses import dataclass

SECONDS_PER_YEAR = 60 * 60 * 24 * 365.25


@dataclass(frozen=True)
class SpaceAge:
    seconds: int

    def on_earth(self) -> float:
        return self.__compute_age(1.0)

    def on_mercury(self) -> float:
        return self.__compute_age(0.2408467)

    def on_venus(self) -> float:
        return self.__compute_age(0.61519726)

    def on_mars(self) -> float:
        return self.__compute_age(1.8808158)

    def on_jupiter(self) -> float:
        return self.__compute_age(11.862615)

    def on_saturn(self) -> float:
        return self.__compute_age(29.447498)

    def on_uranus(self) -> float:
        return self.__compute_age(84.016846)

    def on_neptune(self) -> float:
        return self.__compute_age(164.79132)

    def __compute_age(self, orbital_period: float) -> float:
        return round(self.seconds / SECONDS_PER_YEAR / orbital_period, 2)
