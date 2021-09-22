using Godot;
using System;

public class PlayerGhost2 : KinematicBody2D
{
    Vector2 direction;
    float movementSpeed = 500;
    float gravity = 90;
    float maxFallSpeed = 1000;
    float minFallSeed = 5;
    float jumpForce = 1000;

    private AnimatedSprite _animatedSprite;

    public override void _Ready()
    {
        _animatedSprite = GetNode<AnimatedSprite>("AnimatedSprite");
    }

    public override void _PhysicsProcess(float delta)
    {
        //Player gravity
        direction.y += gravity;
        if (direction.y > maxFallSpeed)
        {
            direction.y = maxFallSpeed;
        }
        if (IsOnFloor())
        {
            direction.y = minFallSeed;
        }
        //Player movements
        direction.x = Input.GetActionStrength("move_right") - Input.GetActionStrength("move_left");
        direction.x *= movementSpeed;

        //Player jump
        if (IsOnFloor() && Input.IsActionJustPressed("move_up"))
        {
            direction.y = -jumpForce;
        }

        //flliping sprite
        if (direction.x > 0)
        {
            _animatedSprite.FlipH = false;
        }
        else if (direction.x < 0 )
        {
            _animatedSprite.FlipH = true;
        }

        //Playing animation
         if (Input.IsActionPressed("move_left"))
        {
            _animatedSprite.Play("walk");
        }
        else if (Input.IsActionPressed("move_right"))
        {
            _animatedSprite.Play("walk");
        }
        else
        {
            _animatedSprite.Play("idle");
        }

        direction = MoveAndSlide(direction, Vector2.Up);

    }

}

