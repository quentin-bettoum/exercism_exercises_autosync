from dataclasses import dataclass

SECONDS_PER_YEAR = 60 * 60 * 24 * 365.25


@dataclass
class SpaceAge:
    seconds: int

    def on_earth(self) -> float:
        return round(self.seconds / SECONDS_PER_YEAR, 2)

    def on_mercury(self) -> float:
        return round(self.seconds / SECONDS_PER_YEAR / 0.2408467, 2)

    def on_venus(self) -> float:
        return round(self.seconds / SECONDS_PER_YEAR / 0.61519726, 2)

    def on_mars(self) -> float:
        return round(self.seconds / SECONDS_PER_YEAR / 1.8808158, 2)

    def on_jupiter(self) -> float:
        return round(self.seconds / SECONDS_PER_YEAR / 11.862615, 2)

    def on_saturn(self) -> float:
        return round(self.seconds / SECONDS_PER_YEAR / 29.447498, 2)

    def on_uranus(self) -> float:
        return round(self.seconds / SECONDS_PER_YEAR / 84.016846, 2)

    def on_neptune(self) -> float:
        return round(self.seconds / SECONDS_PER_YEAR / 164.79132, 2)
