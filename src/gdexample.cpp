#include "gdexample.h"
#include <string>

using namespace godot;

void GDExample::_register_methods() {
	register_method("_process", &GDExample::_process);
	register_property<GDExample, float>("amplitude", &GDExample::amplitude, 10.0);
	register_property<GDExample, float>("speed", &GDExample::set_speed, &GDExample::get_speed, 1.0);

	register_signal<GDExample>(godot::String{"position_changed"}, godot::Dictionary{});
}

GDExample::GDExample() {
}

GDExample::~GDExample() {
	// add your cleanup here
}

void GDExample::_init() {
	// initialize any variables here
	time_emit = 0.0;
	time_passed = 0.0;
	amplitude = 100.0;
	speed = 2.0;
}

void GDExample::_process(float delta) {
	time_passed += speed * delta;

	Vector2 new_position = Vector2(
		amplitude + (amplitude * sin(time_passed * 2.0)),
		amplitude + (amplitude * cos(time_passed * 1.5))
	);

	// Godot::print(std::to_string(delta).c_str());

	set_position(new_position);

	time_emit += delta;

	// Godot::print(std::to_string(time_emit).c_str());

	if (time_emit > 1.0) {
		

		emit_signal("position_changed");

		time_emit = 0.0;
	}
}

void GDExample::set_speed(float p_speed) {
	speed = p_speed;
}

float GDExample::get_speed() {
	return speed;
}
